console.log() is the statement to run code in JS, it displays information in the JS console.
it's a usefull tool to test code
```
console.log(1);
# returns 1
```
Variables can be used to store information as a container:
```
let test;
```
The *let* keyword is needed to declare a variable, in this case with the name **test**
But, we need to *initialize* our variable in order to store info to it:
```
let test;
test = 1;
console.log(test);
# returns 1, we declared a variable, we assigned a value to it and then we access the value with console.log().
```
We can improve the code by declaring and assigning a variable and the value at the same time: 
```
let test = 1;
console.log(test);
```

**NOTE: if a varible is already decladed with *let*, we can change his value just by assigning another one later on**
```
let num = 0;
console.log(num);
num = 2;
console.log(num);
# this returns 0 first, and then 2, since the value has changed later on
```
