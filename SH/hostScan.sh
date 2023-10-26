#!/bin/bash

# Function to handle Ctrl+C interruption
function ctrl_c(){
  echo -e "\n\n[!] Exiting...\n"
  exit 1
}

# Function to display script usage and options
function usage() {
  echo "Usage: $0 -p PREFIX [-s START_HOST] [-e END_HOST] [-w TIMEOUT]"
  echo
  echo "  -p  IP address prefix (e.g. 192.168.1)."
  echo "  -s  Starting host number (default: 1)."
  echo "  -e  Ending host number (default: 254)."
  echo "  -w  Ping timeout in seconds (default: 1)."
  echo "  -h  Display this help."
  echo
  echo "Examples:"
  echo "  $0 -p 192.168.1"
  echo "  $0 -p 10.0.0 -s 10 -e 20"
  echo "  $0 -p 192.168.1 -w 2"
  exit 1
}

# Function to validate the IP prefix format
function validate_ip() {
  local ip=$1

  # Use a regular expression to validate the IP format
  if [[ ! $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    echo "[!] Invalid IP prefix: $ip"
    exit 1
  fi
  
  # Validate each octet (less than 256)
  local IFS=.
  local -a octets=($ip)
  for octet in "${octets[@]}"; do
    if ((octet > 255)); then
      echo "[!] Invalid IP prefix: $ip"
      exit 1
    fi
  done
}

# Default options
START_HOST=1
END_HOST=254
TIMEOUT=1

# Processing script options using getopts
while getopts "p:s:e:w:h" opt; do
  case $opt in
    p) PREFIX="$OPTARG" ; validate_ip $PREFIX ;;  # IP Prefix
    s) START_HOST="$OPTARG" ;;  # Starting host
    e) END_HOST="$OPTARG" ;;  # Ending host
    w) TIMEOUT="$OPTARG" ;;  # Timeout
    h) usage ;;  # Display help
    *) usage ;;  # Any other option displays the help
  esac
done

# Validation to ensure the IP prefix was specified
if [ -z "$PREFIX" ]; then
  echo "[!] You must specify an IP prefix with -p."
  usage
fi

# Set the handler for Ctrl+C
trap ctrl_c INT

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Create temporary directory to store the result
TMP_DIR=$(mktemp -d -t hostscan-XXXXXX)
OUTPUT_FILE="${TMP_DIR}/scan_result.txt"

# Hide the cursor for better aesthetics during the scan
tput civis

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

# Scan hosts in a loop
count=0
for i in $(seq $START_HOST $END_HOST); do
  # Use ping to detect if the host is active
  timeout $TIMEOUT bash -c "ping -c 1 $PREFIX.$i &>/dev/null" && echo -e "${GREEN}[+] Host $PREFIX.$i - ACTIVE${NC}" | tee -a $OUTPUT_FILE &
  ((count++))

  # If we've scanned half of the hosts, wait a moment before continuing
  if [ $count -eq $(($END_HOST / 2)) ]; then
    echo -e "${YELLOW}[!] Waiting a moment before continuing...${NC}"
    sleep 5
  fi
  
  # Display progress bar
  show_progress $END_HOST $i
done
wait

# At the end of the scan, display the location of the result file
echo -e "${BLUE}Results saved in: ${OUTPUT_FILE}${NC}"

# Restore the cursor
tput cnorm
