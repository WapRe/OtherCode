<h2>Operators</h2>

We can use different *comparison operators*:
-  **==** checks if 2 values are equal (always return a boolean)
-  **===** checks if 2 values are strictly equal, value and type. 
-  **!=** checks if 2 values are *not equal* (returs a boolean)
-  **>** checks if the left value is greater than the right value.
-  **<** checks if the left value is less than the right value.
-  **<= or >=** less than or equal, greater than or equal.

And the typical *arithmetic operators*:
-  +, -, *, /, % (reminder of division), ** (exponentiation)
-  ++ Increment (we increment the value by 1), -- Decrement (same, but decrement by 1)

<h2>Assignment operators</h2>

So, in other terms:
```js
let x = 10;

x++; //Is the same as:
x = x + 1;
```
If we want to add more than 1, increment does not work:
```js
let x = 10;

x = x + 5;
// or:
x += 5; // is the same, and can be used with other operators:

x = x * 4;
x *= 4;

x = x - 5;
x -= 5;
```

<h2>Ternary Operators</h2>
Lets create an exemple, lets say that if a client has more than 50 points, is a vip customer, otherwise is a silver customer. <br>

We can represent this with `:`
```js
let points = 75;
let type = points > 50 ? 'gold' : 'silver';
// when points > 50, we have true statement, with `:` we represent the Otherwise statement.
console.log(type);
```

<h2>Logical Operators (Booleans) </h2>

- **AND** , returns `true` if both operands are `true`
- **OR (||)** , returns `true` if one of the operands is `true`
- **NOT (!)**, give us the opposite:
```js
let one = 1;
typeof(1)

> 'number'
1 == true
> true
!1 == true
> false
```

<h2>Logical Operators (Non Booleans)</h2>

- **Falsy (false)** ara values like, *undefined, null, 0, false, ' ', Nan (NotANumber)*
- **Truthy**, anything else that is not falsy.
  - it is important to know, that when compared with `OR` with like:
```js
false || true
> true
false || 1 || 2
> 1
// when the first truly value appears, js returns it when the statement is resolved
```

