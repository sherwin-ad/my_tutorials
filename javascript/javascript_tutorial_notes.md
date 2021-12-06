[TOC]



## What is JavaScript?

- JavaScript is mostly known as client side scripting language. 

- JavaScript initially use to make your page alive.

- At present Javascript not only execute on browser but also on the server.

  Nodejs - sample of server side javascript language

## History of JavaScript?
- JavaScript was developed by Brendan Eich in 1995.
- JavaScript started his life with the name Mocha and was concisely named LiveScript.
- Then LiveScript officially renamed to JavaScript.
- Java was very popular language at that time, So to tie into success LiveScript renamed JavaScript.

## What is ECMAScript?
- In 1996 Netscape submitted JavaScript to ECMA.
- ECMA (European Computer Manufacturers Association ) is a private international non-profit standard organization.
- The Relation between ECMA Specification.
- JavaScript is Implementation of ECMAScript

## What is ES6?

- ECMAScript 6 is update of ES5 which was standardized in 2009.
- ES6 was published by ECMA International in June 2015.

## Hello World

index.html

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Javascript</title>

</head>
<body>

    
<script>
// This is Hello World Program of JavaScript

 /* 
 This is
 Hello World Progream
 in JavaScript
 */
 console.log("Hello World!");
</script>    
</body>
</html>
```

## What is Variables?

- If I wanted to simply describe a variable then I would like to say a variable is just a name of the specific value.
- So now let me first tell you how to create a variable.

```javascript
<script>
'use strict'

let firstname, lastname = "Daily Tuition", age = 24;

console.log(firstname);
console.log(lastname);
console.log(age);
</script>    
```



## What is Constant?

- In ES6 a new Keyword added in the JavaScript which is const.
- Constant also hold value but unlike variables It can't be changed after initialization.
- we cannot change the constant value after you declare it.

```javascript
<script>
const TEMP = 12.4, NAME = "Daily";

console.log(TEMP);
console.log(NAME);
</script>    
```

#### Naming Roles of Identifiers
- Identifier consists of letters numbers Underscore ( _ ) and the Dollar sign ( $ ).
- Unicode character are allowed.
- Identifier must start with the letter Dollar sign ( $ ) or underscore ( _ ).
- Identifier cannot be a reserved word.



## What is Literals?
- So the literal means You are providing a value directly in the program.
- Literals is just the way to create identifier with the value.

```javascript
<script>
let Goal = "Tutorial Makes Happy";
let reference = Goal;

console.log(reference);
</script>    
```



## Data Type in JavaScript

#### Primitive Types

- immutable value (that is, values which can't be changed)

1. **String**

   - String is just a simple text data.

   - we can specify string in the single or double quotes or you can use both.

     example:

     ```
     let text = "This is your Sting DATA";
     
     let text = 'This is your Sting DATA';
     ```

2. **Boolean**

   - Boolean is just a value type That have only two possible values. true or false.

   - don't specify the Boolean type in the Quotation mark ( " " ).

     example:

     ```
     let DO = true;
     
     let More = false;
     ```

3. **Symbols**

   - In ecmascript 6 we have a new type symbol.

   - Symbols is the new data type in es6 which represent Unique tokens.

   - Once you create a symbol it is unique and it will not match any other symbols.

     example:

     ```
     const blue = symbol();
     
     const white = symbol("Color White");
     ```
   
4. **Null and Undefined**

   - JavaScript has two special types null and undefined.

   - Now has only one possible value which is Null and undefined has only one possible value undefined.

   - Both null and undefined Represent something that doesn't exist.

     example:

     ```
     let Myvalue;
     
     Myvalue = null;
     
     Myvalue = 19.4;
     
     Myvalue = undefined;
     ```


## Object Types

### What is Object?

- Objects are mutable.

- Can change any value anytime.

- Object is just like a Container that can have different kind of data.

- Object literal syntax : { }

  ```javascript
  <script>
  const obj = {
      name: "Sherwin",
      age: 45
  };
  
  //deleting property
  delete obj.age;
  
  console.log(obj.name);
  console.log(obj.age);
  
  
  </script>    
  ```

  

### Array

- Array is Collection of Different types of data.
- Array Start with [0] and end with [n] value.

**Important Features of Array**

- Array element can be any type of data. it may be objects or primitive type.

- Array size is not fix so you can add and remove array element anytime

- Array is zero based. so the first element of the array is zero the next element is 1 and so on.

  ```javascript
  <script>
  
  // create an array with different type of data
  const a1 = [1,2,3,4,5]
  const a2 = [1,2,null,4,"five"]
  const a3 = ['hello','world','array']
  
  // have a array containing array
  const a4 = [
      [1,2,3],
      [4,5,6]
  ];
  
  // get the array length
  console.log(a1.length);
  
  // get array value
  console.log(a1[0]);
  console.log(a3[0]);
  
  // change array element
  a3[0] = "Welcome"
  console.log(a3[0]);
  
  </script>    
  ```

### Date

- So dates are represent the date and time using date object.

- Date object used to get date or you can use to set date for a particular event.

- you can also specify time using date of object.

  ```javascript
  <script>
  
  // display date
  const now = new Date();
  
  // display date with time
  const dt = new Date(2021,10,28,14,0);  
  
  console.log(now);
  console.log(dt);
  
  </script>    
  ```

  

### Regular Expression

- Regular expression is sub language of JavaScript.
- it is used to Perform Complex search and replace operations on strings.
- Once you create a symbol it is unique and it will not match any other symbols.



### Map and sets

- In new ECMAScript 6 a new data type introduced is map and set And their week counterpart, WeakMap and WeakSet.

- Maps are just like an object but it Offers more advantages then object in certain situations..

- Set are similar to array except they Can't content duplicate element.

  ```javascript
  <script>
  
  // create Map
  const roles = new Map();
  
  // assign role to the users
  roles.set(t1,"User1");
  roles.set(t2,":User2");
  
  </script>    
  ```

  ```javascript
  <script>
  
  // create Map
  const roles = new Map();
  
  // assign role to the users
  roles.set(t1,"User1");
  roles.set(t2,":User2");
  </script>    
  ```

  

## What is String?

- String is just a simple text data.
- You can also say string is a collection of characters, Numbers, and symbols.
- In JavaScript string represent Unicode text

### What is Unicode text?

- Unicode text is a computing industrial standard For representing text data.
- Unicode store letter and characters By assigning a number of each one.

```javascript
<script>

// both are correct 
let str = 'we took bag from him, he said "This is my bag"';

let str1 = "Don't touch my bag";

// produce an error
let strerror = "we took bag from him, he said "Don't touch my bag"";

// Escaping 
let str2 = "we took bag from him, he said \"Don \'t touch my bag \"";

console.log(str2);
</script>    
```

### Special Characters

| Escaping Characters | Description |
| :-----------------: | :---------: |
|         \n          | Newline |
|         \r          | Carriage Return |
|         \t          | Tab |
|       ` \' & \"`       | Single and Double Quote |
| ` \` ` | Backtick (new ES6) |
| ` \$ ` | Dollar Sign (new ES6) |
| ` \\ ` | Backslash |
| ` \\uXXXX ` | Unicode Format |

### String concatenation

```javascript
<script>
// String Concatenation 
let temp = 20.5;
let strcat = "Weather of Philippines is " + temp + "\u00b0c";
// or
let temp1 = 22.5;
let strcat1 = `Weather of Malaysia is ${temp1}\u00b0c`;

console.log(strcat);
console.log(strcat1);
</script>    
```

### New Line

```javascript
<script>
// Multiline
let str1 = "First line \nSecond line \nThird line";
let str2 = `First line 
Second line
Third line`;

console.log(str1);
console.log(str2)
</script>    
```



## If and Else Statement

```
<script>
let time = 15

if (time < 12)
    console.log("Good Morning");
else
    console.log("Good Afternoon"); 

</script>    
```

```
<script>
let time = 9

if (time < 12){
    console.log("Good Morning");
	if (time == 9){
    	console.log("The time is to take your breakfast");
    }
}
else{
    console.log("Good Afternoon");    
}

</script>    
```

```
<script>
let time = 13;

if (time < 12){
    console.log("Good Morning");
} 
else if (time < 17){
    console.log("Good Afternoon");
}
else {
    console.log("Good Evening");    
}

</script> 
```



## Switch Case Statement

```javascript
<script>
/*
 JavaScript     2)Python
 3)PHP          4)Asp.net

*/

let ans = 3;

switch (ans) {
    case 1:
        console.log("You have select JavaScript");
        break;
    case 2:
        console.log("You have select Python");
        break;
    case 3:
        console.log("You have select PHP");
        break;
    case 4:
        console.log("You have select Asp.net");
        break;
    default:
        console.log("Sorry, You have choose wrong answer!");
        break;
}
</script>    		
```



## While Loop

```
let count = 0;

while (count < 10) {
    console.log(count);
    count++;
}
```



## Do While

 
