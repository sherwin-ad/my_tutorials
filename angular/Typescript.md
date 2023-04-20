### Typescript 

Install Typescript

```
sudo npm install -g typescript
/usr/local/bin/tsc -> /usr/local/lib/node_modules/typescript/bin/tsc
/usr/local/bin/tsserver -> /usr/local/lib/node_modules/typescript/bin/tsserver
/usr/local/lib
└── typescript@3.9.5 

```

Check Typescript Version

```
tsc --version
Version 3.9.5
```



#### Create hello world

Create typescript file main.ts

```
function log(message) {
    console.log(message);
}

var message = 'Hello World';

log(message);
```



Compile typescript file main.ts  (it will create file main.js)

```
tsc main.ts 
```

Run javascript file main.js 

```
node main.js 
Hello World
```



#### Data Types

| Type    | Declare                                                |
| ------- | ------------------------------------------------------ |
| String  | let custom­erName: string= "John Doe";                 |
| Number  | let price: number = 19.95;                             |
| Boolean | let shipped: boolean = false;                          |
| Date    | let orderDate: Date = new Date(2017, 2, 9);            |
| Any     | let something: any = "Can be anythi­ng";               |
| Enum    | enum Color {Red, Green, Blue};                         |
| Array   | let cards: string[] = ['Visa', 'Maste­rCa­rd'];        |
| Null    | let orderId: number = null;                            |
| Tuple   | let stateT­axR­ates: [string, number];                 |
| Void    | function log(msg: string): void {  console.log(msg); } |
| Const   | const lives: number = 99;                              |



#### Type Assertions

Here, you will learn about how TypeScript infers and checks the type of a variable using some internal logic mechanism called Type Assertion.

Example: Type Assertion

```
let code: any = 123; 
let employeeCode = <number> code; 
console.log(typeof(employeeCode)); //Output: number
```

Example: Type Assertion with Object

```
let employee = { };
employee.name = "John"; //Compiler Error: Property 'name' does not exist on type '{}'
employee.code = 123; //Compiler Error: Property 'code' does not exist on type '{}'
```

```
interface Employee { 
    name: string; 
    code: number; 
} 

let employee = <Employee> { }; 
employee.name = "John"; // OK
employee.code = 123; // OK
```



**There are two ways to do type assertion in TypeScript**:

1. Using the angular bracket <> syntax. 

```
let code: any = 123; 
let employeeCode = <number> code; 
```

However, there is another way to do type assertion, using the 'as' syntax.

2. Using as keyword

```
let code: any = 123; 
let employeeCode = code as number;
```



#### Arrow Functions

Fat arrow notations are used for anonymous functions i.e for function expressions. They are also called lambda functions in other languages.

Syntax:

```
(param1, param2, ..., paramN) => expression
```

Example: Fat Arrow Function

```
let sum = (x: number, y: number): number => {
    return x + y;
}

sum(10, 20); //returns 30
```

The above arrow function `sum` will be converted into the following JavaScript code.

```
var sum = function (x, y) {
    return x + y;
}
```



The following is an arrow function without parameters.

Example: Parameterless Arrow Function

```
let Print = () => console.log("Hello TypeScript");

Print(); //Output: Hello TypeScript
```



Furthermore, if the function body consists of only one statement then no need for the curly brackets and the return keyword, as shown below.

```
let sum = (x: number, y: number) => x + y;

sum(3, 4); //returns 7
```



A class can include an arrow function as a property, as shown below.

Example: Arrow Function in Class

```
class Employee {
    empCode: number;
    empName: string;

    constructor(code: number, name: string) {
        this.empName = name;
        this.empCode = code;
    }

    display = () => console.log(this.empCode +' ' + this.empName)
}
let emp = new Employee(1, 'Ram');
emp.display();
```



#### TypeScript - Interfaces

* Interface is a structure that defines the contract in your application. It defines the syntax for classes to follow. Classes that are derived from an interface must follow the structure provided by their interface.
* The TypeScript compiler does not convert interface to JavaScript. It uses interface for type checking. This is also known as "duck typing" or "structural subtyping".
* An interface is defined with the keyword `interface` and it can include properties and method declarations using a function or an [arrow function](https://www.tutorialsteacher.com/typescript/arrow-function).

Example: Interface

```
interface IEmployee {
    empCode: number;
    empName: string;
    getSalary: (number) => number; // arrow function
    getManagerName(number): string; 
}
```

**Interface as Type**

* Interface in TypeScript can be used to define a type and also to implement it in the class.

Example: Interface as Type

```
interface KeyPair {
    key: number;
    value: string;
}

let kv1: KeyPair = { key:1, value:"Steve" }; // OK

let kv2: KeyPair = { key:1, val:"Steve" }; // Compiler Error: 'val' doesn't exist in type 'KeyPair'

let kv3: KeyPair = { key:1, value:100 }; // Compiler Error: 
```



**Interface as Function Type**

* TypeScript interface is also used to define a type of a function. This ensures the function signature.

Example: Function Type

```
interface KeyValueProcessor
{
    (key: number, value: string): void;
};

function addKeyValue(key:number, value:string):void { 
    console.log('addKeyValue: key = ' + key + ', value = ' + value)
}

function updateKeyValue(key: number, value:string):void { 
    console.log('updateKeyValue: key = '+ key + ', value = ' + value)
}
    
let kvp: KeyValueProcessor = addKeyValue;
kvp(1, 'Bill'); //Output: addKeyValue: key = 1, value = Bill 

kvp = updateKeyValue;
kvp(2, 'Steve'); //Output: updateKeyValue: key = 2, value = Steve 
```



