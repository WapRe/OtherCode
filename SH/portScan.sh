#!/bin/bash

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to handle the Ctrl+C interruption
function ctrl_c(){
  echo -e "\n\n${RED}[!] Exiting...${NC}\n"
  stty echo
  tput cnorm
  exit 1
}

# Function to display the script usage and options
function usage() {
  echo "Usage: $0 -t TARGET [-s START_PORT] [-e END_PORT] [-p PARALLEL] [-w TIMEOUT]"
  echo
  echo "  -t  IP address or target hostname."
  echo "  -s  Starting port (default: 1)."
  echo "  -e  Ending port (default: 65535)."
  echo "  -p  Number of parallel scans (default: 100)."
  echo "  -w  Timeout in seconds (default: 1)."
  echo "  -h  Displays this help."
  echo
  echo "Examples:"
  echo "  $0 -t 192.168.1.10"
  echo "  $0 -t example.com -s 1 -e 1024"
  echo "  $0 -t 192.168.1.10 -w 2 -p 50"
  exit 1
}

# Function to validate an IP or hostname
function validate_ip_or_hostname() {
  local target=$1

  # Use a regex to validate IP format
  if [[ ! $target =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    # If it's not an IP, we can do a quick DNS resolution to verify if it's a valid hostname
    if ! host $target &> /dev/null; then
      echo -e "${RED}[!] Invalid IP address or hostname: $target ${NC}"
      exit 1
    fi
  fi
}

# Function to validate port range
function validate_port_range() {
  local port=$1

  if [[ ! $port =~ ^[0-9]+$ ]] || ((port < 1 || port > 65535)); then
    echo -e "${RED}[!] Invalid port range. Must be between 1 and 65535. ${NC}"
    exit 1
  fi
}

# Default options
START_PORT=1
END_PORT=65535
PARALLEL=100
TIMEOUT=1

# Process script options using getopts
while getopts "t:s:e:p:w:h" opt; do
  case $opt in
    t) TARGET="$OPTARG" ; validate_ip_or_hostname $TARGET ;;  # Target IP or hostname
    s) START_PORT="$OPTARG" ; validate_port_range $START_PORT ;;  # Starting port
    e) END_PORT="$OPTARG" ; validate_port_range $END_PORT;;  # Ending port
    p) PARALLEL="$OPTARG" ;;  # Parallel scans
    w) TIMEOUT="$OPTARG" ;;  # Timeout
    h) usage ;;  # Display help
    *) usage ;;  # Any other option displays the help
  esac
done

# Validate that END_PORT is not smaller than START_PORT
if (( END_PORT < START_PORT )); then
  echo -e "${RED}[!] Error: The ending port (END_PORT) cannot be smaller than the starting port (START_PORT).${NC}"
  exit 1
fi

# Validation to ensure the target (TARGET) was specified
if [ -z "$TARGET" ]; then
  echo -e "${RED}[!] You must specify a target with -t.${NC}"
  usage
fi

# Create temporary directory to save the result
TMP_DIR=$(mktemp -d -t portscan-XXXXXX)
OUTPUT_FILE="${TMP_DIR}/scan_result.txt"

# Set the handler for Ctrl+C
trap ctrl_c INT

# Hide the cursor for aesthetic improvement during the scan
tput civis

# Deactivate the input
stty -echo

# Function to display progress bar
function show_progress {
  local total=$1
  local current=$2
  local width=50
  local perc=$(( ($current * 100) / $total ))
  local progress=$(( ($current * $width) / $total ))
  echo -ne "["
  for i in $(seq 1 $width); do
    if [ $i -le $progress ]; then
      echo -ne "="
    else
      echo -ne " "
    fi
  done
  echo -ne "] ${perc}%\r"
}

# Port scanning in a loop
count=0

# Initialize the buffer for open port messages
open_ports_buffer=""

for port in $(seq $START_PORT $END_PORT); do
  (
    # Try to connect to the port and, if successful, add to the buffer
    if timeout $TIMEOUT bash -c "echo > /dev/tcp/$TARGET/$port" 2>/dev/null; then 
      open_ports_buffer="${open_ports_buffer}${GREEN}[+] $port - OPEN${NC}"
      echo -n -e "${open_ports_buffer}" | tee -a $OUTPUT_FILE
      open_ports_buffer=""
    fi
  ) &
  ((count++))

  # Display progress bar
  show_progress $END_PORT $port
  
  # If there are open ports in the buffer, print them
  if [ ! -z "$open_ports_buffer" ]; then
    echo -e "${open_ports_buffer}"
    open_ports_buffer=""
  fi
  
  # Wait after a certain number of parallel scans
  if (( count % PARALLEL == 0 )); then
    wait
  fi
done
wait

# Upon scan completion, display the location of the results file
echo -e "\n${GREEN}Results saved at:${YELLOW} ${OUTPUT_FILE}${NC}\n"

# Check if xclip is installed
if command -v xclip > /dev/null; then
    # Copy the path to the clipboard and display a message about it
    echo -n "${OUTPUT_FILE}" | xclip -selection clipboard
    echo -e "${GREEN}The file path has also been copied to the clipboard.${NC}"
else
    echo -e "${RED}Note: 'xclip' is not installed, so the file path couldn't be copied to the clipboard.${NC}"
fi

# Re-activate the input
stty echo

# Restore the cursor
tput cnorm
