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
