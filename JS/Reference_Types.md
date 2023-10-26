<h3>Objects</h3>
Are the kind of values with key pairs inside, typically in {} :

```
let person = {
  name: 'WapRe',
  age: 30
};
```
Here we have the object *person* with two properties, we can check it or even change it by:
```
person.age = 50;
person.name #to use it in other functions. 
```

<h3>Array</h3>
We can use array in order to store a list.

```
let selectedColours = ['red', 'blue'];
console.log(selectedColours[0]); # we can use the index to select wich element we want.
selectecColours[2] = 'grey'; # we can add elements in the array (can be a number too)
```
**NOTE: an array is an object is JS**
Also, everytime we create an array, we can access to different properties (lenght, find, etc...inherited in JS)


<h3>Function</h3>
A set of statements that performs a task or calculates a value.

```
function great(){
  //body of the function
  console.log('Hello World!');
}
// we can call the funcion like this:
great();
```
We can add inputs to the functions:
```
function greet(name){ // here, name is a parameter
  console.log('Hello' + name)
}
greet('WapRe'); // and here, is an argument. 
```
We can have multiple parameters:
```
function greet(name, lastName){ // here, name is a parameter
  console.log('Hello' + name + ' ' + lastName)
}
greet('WapRe','Smith')
```


