<h2>Operators</h2>

We can use different *comparison operators*:
-  **==** checks if 2 values are equal (always return a boolean)
-  **!=** checks if 2 values are *not equal* (returs a boolean)
-  **>** checks if the left value is greater than the right value.
-  **<** checks if the left value is less than the right value.
-  **<= or >=** less than or equal, greater than or equal.

And the typical *arithmetic operators*:
-  +, -, *, /, % (reminder of division), ** (exponentiation)
-  ++ Increment (we increment the value by 1), -- Decrement (same, but decrement by 1)

<h2>Assignment operators</h2>

So, in other terms:
```
let x = 10;

x++; //Is the same as:
x = x + 1;
```
If we want to add more than 1, increment does not work:
```
let x = 10;

x = x + 5;
// or:
x += 5; // is the same, and can be used with other operators:

x = x * 4;
x *= 4;

x = x - 5;
x -= 5;
```
