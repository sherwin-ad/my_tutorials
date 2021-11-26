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

     

     

     


​     