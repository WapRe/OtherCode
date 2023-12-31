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
Best practice is to define each variable in different lines, but we can declare different variables at the same time to: 
```
let firstName = 'Tom', lastName = 'Smith';
```

We can also create a variable with *const* , **BUT** the difference is that you can not assign a new value later on.
It is a **Constant Variable**. 
Also, we can not write it in the same way:
```
let num;
num = 2;
console.log(num);
# Will return 2, otherwise:
const test;
test = 2;
console.log(test);
# This is a typical common SyntaxError:
const test = 2; # We need to define it directly.
```

There are few **rules** for variables:
-  Cannot be a reserved keyword (let, if, or, etc...). If we try to declare a variable named as a reserved keyword, it will not work.
-  Good practice coding, use meaningful names so anybody can know what it is stored in this variable.
-  Variables can no start with a number.
-  Cannot contain a space or hypen (-)
-  Good practice for writting variables is in cammel notation (1rst letter is lowercase, next word in upper case like 'firstName'
-  JS is case sensitive with variables, 'firstName' and 'Firstname' are different variables if declared. 
