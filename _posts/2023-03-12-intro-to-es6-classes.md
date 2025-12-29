---
title: "An Introduction to ES6 Classes in JavaScript"
image:
  path: /assets/img/intro-to-es6-classes/intro-to-es6-classes-p.png
author: vivek
date: 2023-03-12 13:00:00 +0530
categories: [JavaScript, ES6]
tags: [class]
description: Learn everything you need to know about ES6 classes in JavaScript, from the syntax of class declaration to inheritance, static methods, and more.
pin: false
---

ES6 classes are a powerful feature of JavaScript that allows you to define and work with object-oriented programming concepts in a simpler and more intuitive way. With ES6 classes, you can create reusable templates for objects that share common properties and behavior, and easily define new subclasses that inherit from a parent class. In this blog post, we will provide a comprehensive overview of ES6 classes, including their syntax, properties, methods, and inheritance. Whether you're new to JavaScript or an experienced developer, this guide will give you everything you need to know to start working with ES6 classes.

>

{: .prompt-tip }

> **"Birds of a feather flock together"** means that people or things of similar characteristics tend to associate with one another. Similarly the objects of the same class tend to share similar characteristics, such as properties and methods.

### Class

To define a class in ES6, you use the `class` keyword, followed by the name of the class, and a set of curly braces containing the class body. Here's an example:

```javascript
class Person {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  sayHello() {
    console.log(
      `Hello, my name is ${this.name} and I am ${this.age} years old.`
    );
  }
}
```

In this example, we've defined a class called `Person` with a constructor function that sets two properties (`name` and `age`) and a method called sayHello that logs a message to the console.

To create a new instance of this class, you can use the new keyword:

```javascript
const person1 = new Person("Alice", 30);
person1.sayHello(); // logs "Hello, my name is Alice and I am 30 years old."
```

### Constructor

A class can have a constructor method, which is a special method that is called when a new instance of the class is created. It is used to initialize the properties of the class. Where properties are variables that belong to the class and can be accessed by all instances of the class. Class methods are functions that belong to the class and can be called by all instances of the class.

### Properties

Properties are variables that belong to a class and can be accessed by all instances of the class. In ES6 classes, properties can be defined inside the class body and accessed using the `this` keyword.
In the example above, `name` and `age` are the properties.

### Methods

Methods are functions that belong to a class and can be called by all instances of the class. In ES6 classes, methods can be defined inside the class body and accessed using the `this` keyword.
In the example above, `sayHello` is the method.

### Getters and Setters

Getters and setters are special methods that allow you to define how a property of a class should be accessed or modified. Getters are used to read the value of a property, while setters are used to write a value to a property. In ES6 classes, getters and setters are defined using the `get` and `set` keywords, respectively.

```javascript
class Person {
  constructor(name, age) {
    this._name = name;
    this._age = age;
  }

  get name() {
    return this._name.toUpperCase();
  }

  set age(age) {
    if (age > 0 && age < 120) {
      this._age = age;
    } else {
      console.log("Invalid age!");
    }
  }

  get age() {
    return this._age;
  }
}

const person = new Person("Alice", 25);

console.log(person.name); // Output: "ALICE"
console.log(person.age); // Output: 25

person.age = 30;
console.log(person.age); // Output: 30

person.age = -5; // Output: "Invalid age!"
```

In the above example, we define a Person class with two properties: `_name` and `_age`. We then define three methods: `get name()`, `set age()`, and `get age()`. The `get name()` method returns the name of the person in uppercase. The `set age()` method sets the `_age` property of the object, but only if the value is between 0 and 120. If the value is outside this range, an error message is printed to the console. The `get age()` method returns the age of the person.

We then create an instance of the `Person` class and call its `name` and `age` properties using getters. We also set the `age` property of the person to 30 and print out its value again. Finally, we try to set the `age` property to an invalid value (-5), which triggers the error message from the `set age()` method.

### Inheritance

Inheritance is a mechanism in object-oriented programming that allows you to define a new class based on an existing class, inheriting its properties and methods. In ES6, you can use the extends keyword to create a subclass that inherits from a parent class.

```javascript
class Animal {
  constructor(name, age) {
    this._name = name;
    this._age = age;
  }

  eat() {
    console.log(`${this._name} is eating.`);
  }

  sleep() {
    console.log(`${this._name} is sleeping.`);
  }
}

class Dog extends Animal {
  constructor(name, age, breed) {
    super(name, age);
    this._breed = breed;
  }

  bark() {
    console.log(`${this._name} is barking.`);
  }
}

const myDog = new Dog("Buddy", 3, "Golden Retriever");

myDog.eat(); // Output: "Buddy is eating."
myDog.sleep(); // Output: "Buddy is sleeping."
myDog.bark(); // Output: "Buddy is barking."
```

In the above example, we define an `Animal` class with two properties: `_name` and `_age`, and two methods: `eat()` and `sleep()`. We then define a `Dog` class that extends `Animal`. The `Dog` class adds a new property `_breed` and a new method `bark()`.

The `super()` method is used in the `Dog` constructor to call the `Animal` constructor with the `name` and `age` arguments. This initializes the `_name` and `_age` properties of the `Dog` object. The `_breed` property is then initialized with the `breed` argument.

We then create an instance of the `Dog` class and call its `eat()`, `sleep()`, and `bark()` methods, which output messages to the console.

In this example, the `Dog` class inherits the `eat()` and `sleep()` methods from the `Animal` class, and adds a new method `bark()`. This demonstrates how inheritance can be used to reuse code and extend the functionality of an existing class.

### Static methods and properties

Static methods and properties are defined on the class itself rather than on its instances. They are useful for defining utility functions or constants that are associated with the class as a whole, rather than with specific instances of the class. In ES6, you can define static methods and properties using the static keyword.

```javascript
class Circle {
  constructor(radius) {
    this._radius = radius;
  }

  get radius() {
    return this._radius;
  }

  set radius(radius) {
    this._radius = radius;
  }

  get area() {
    return Circle.PI * this._radius * this._radius;
  }

  static get PI() {
    return 3.14159;
  }

  static circumference(radius) {
    return 2 * Circle.PI * radius;
  }
}

const circle = new Circle(5);

console.log(circle.area); // Output: 78.53975
console.log(Circle.PI); // Output: 3.14159
console.log(Circle.circumference(5)); // Output: 31.4159
```

In the above example, we define a `Circle` class with a `radius` property, a getter and setter for `radius`, and a getter for the `area` of the circle. We also define a static `PI` property and a `static circumference()` method. The area getter uses the static `PI` property to calculate the area of the circle.

We then create an instance of the `Circle` class and call its `area` property. We also call the static `PI` property and the static `circumference()` method directly on the Circle class.

In this example, the `PI` property and `circumference()` method are defined on the Circle class itself, rather than on its instances. This means that they can be accessed and used without needing to create an instance of the Circle class first. This demonstrates how static methods and properties can be used to define utility functions or constants that are associated with the class as a whole.

### Class expressions

In addition to class declarations, ES6 also supports defining classes using class expressions.

Here's an example of a class expression:

```javascript
const Person = class {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  sayHello() {
    console.log(`Hello, my name is ${this.name}.`);
  }
};

const john = new Person("John", 30);

john.sayHello(); // Output: "Hello, my name is John."
```

In this example, we define a `Person` class using a class expression. The class is assigned to a variable using the `const` keyword. The class has a constructor method that initializes the `name` and `age` properties of the `Person` object. The class also has a `sayHello()` method that logs a greeting to the console.

We then create an instance of the `Person` class and call its `sayHello()` method.

Class expressions are useful when you want to define a class inline or when you need to create a class dynamically at runtime.

>

{: .prompt-warning }

> There are still some differences between traditional object-oriented programming and JavaScript classes.

### Differences between classes in JavaScript and traditional OOPS!

Classes in JavaScript, including those introduced in ES6, are different from traditional object-oriented programming in some ways.

1. **Class-based inheritance vs. prototype-based inheritance**: In traditional object-oriented programming, classes are used to define objects and their behavior, and inheritance is based on the class hierarchy. In JavaScript, inheritance is based on prototypes, where objects inherit properties and methods from other objects.

2. **Constructors vs. factory functions**: In traditional object-oriented programming, classes typically have constructors that are used to create new instances of the class. In JavaScript, objects can be created using constructor functions or factory functions.

3. **Instance variables vs. dynamic properties**: In traditional object-oriented programming, classes have instance variables that hold state information about the object. In JavaScript, objects can have dynamic properties that can be added or removed at runtime.

4. **Private vs. public properties and methods**: In traditional object-oriented programming, classes often have private and public properties and methods, which can be used to control access to data and behavior. In JavaScript, there is no built-in support for private properties and methods, although there are conventions and techniques for implementing them.

### Conclusion

In conclusion, ES6 classes have revolutionized the way developers write object-oriented code in JavaScript. They provide a more intuitive and familiar syntax, making it easier for developers to write clean and maintainable code. With features like inheritance, constructors, getters and setters, static methods and properties, and the ability to define classes using class expressions, ES6 classes have made JavaScript a more powerful and flexible language for building complex applications.

While there are still some differences between traditional object-oriented programming and JavaScript classes, the benefits of using ES6 classes cannot be ignored. As web applications become more complex and require more sophisticated programming techniques, the use of ES6 classes will continue to grow in popularity.

By embracing the power and flexibility of ES6 classes, developers can build more robust and maintainable applications that are better suited to meet the demands of modern web development. So if you haven't already, it's time to start exploring the world of ES6 classes and see how they can help you build better software.
