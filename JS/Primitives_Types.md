There are different kind of values that can be assigned to a variable:
<h3>String / Number </h3>

By assigning a number to a variable, the variable automatically has the type Number.
We can use the typeof operator to find out the type of a value or variable. 
```
console.log(typeof 1);
const num = 1;
console.log(typeof num);
# returns *number number*
```
We can also assign a text to a variable:
```
const text = 'hello';
console.log(text);
```
There are different ways to assign a text to a variable:
```
let text = "hello";
console.log(text);
text = 'hi';
console.log(text);
text = `bye`;
console.log(text);
```
All those ways are correct, and string type. 

<h3>Boolean</h3>

We can use *const* or *let* to assign a boolean value to a variable:
```
const isRight = true;
let isOnSale = true;
console.log(isOnSale);
isOnSale = false;
console.log(isOnSale);
cosole.log(isRight);
```
Actually, every single value in JavaScript can be transformed to a boolean value.
We can make use of the *Boolean()* function since every single value in JavaScript is considered either truthy or falsy.
```
console.log(Boolean(100));
# returns true
```
The **false** values are the following, and the rest, are **true**: 
```
false
null
undefined
0
-0
NaN
An empty string ('')
```
We can use boolean values to troubleshoot, or other usefull functions. 

<h3>undefined / null</h3>

In fact, a non initialized variable is an undefined variable. Just to mention. 
**But** we can also define a varible as undefined (not very common):
```
let varia = undefined;
```
Same as null, it is possible to define a variable as null:
```
let variab = null;
```
We use null in situations we want to clear the value of a variable. 
For exemple, you select a colour as red and the colour variable is now red, you unselect the colour, it goes back to null. 

