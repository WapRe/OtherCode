We use those staments to have some logic in our application. 

Lets make an example, we set an hour, then **if** its between 6 and 12 it says *Good morning!*, **if** its between 12 and 18 its *Good afternoon!*, otherwise *Good evening!*:
```js
let hour = 7;
if (hour >= 6 && hour < 12){
  console.log("Good morning!");
}
else if (hour >=12 && hour < 18){
  console.log("Good afternoon!");
}
else{
  console.log("Good evening!");
}
```

There are other statements, **switch** & **case**. 

```js
let role = 'moderator';

switch (role){
  case 'guest':
    console.log('Guest User');
    break;

  case 'moderator':
    console.log('Moderator User');
    break;

default:
  console.log('Unkown User');
}

// if nothing is defined, this code will break into default stament, but if it matches 'guest' or 'moderator'
// then will run until break. 
```
It is a good way to compare logic. 

We can also iterate through the code using **for**

```js
for (let i = 0; i < 5; i++){
  console.log('Hello');
}
```
`for` needs to be written like, the *variable, the condition and the increment*. It is very usefull compared to python, since we don't need to add a counter. 
It is commonly used `for` with `in`, so we can set a range in the iteration. 



Using `while` we can write the same code as before, in a different syntaxis:

```js
let i = 0;
while (i<=5){
  if (i % 2 !== 0) console.log(i);
  i++;
}
```

We can use `do` to assure that the condition is completed at least once, and then the `while` loop at the end like:

```js
let i = 2;
do {
  if (i % 2 !== 0) console.log(i);
  i++;
}while (i<=5)
```



