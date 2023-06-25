---
title: "How to Use Middleware in Express"
image:
  path: /assets/img/how-to-use-middleware-in-express/how-to-use-middleware-in-express-p.png
author: vivek
date: 2023-06-01 10:00:00 +0530
categories: [Web Development]
tags: [Express, Middleware, Node.js]
description: Learn how to use middleware in Express to handle HTTP requests and enhance your web applications.
pin: false
---

Middleware plays a crucial role in the Express framework for Node.js. It allows you to handle HTTP requests and responses in a modular and extensible manner. By understanding and utilizing middleware effectively, you can enhance the functionality, security, and performance of your web applications.

In this tutorial, we will explore the concept of middleware in Express, discuss its significance, and learn how to implement it in your Express applications. We will cover both built-in middleware and custom middleware.

## What is Middleware?

Middleware in Express refers to a series of functions that are executed in a sequential order during the request-response cycle. Each middleware function has access to the request and response objects and the next middleware function in the chain. It can perform tasks such as modifying the request or response, executing additional code, or terminating the request-response cycle.

Middleware functions can be used for various purposes, such as:

1. **Logging**: Capturing and logging request details, such as the requested URL, method, or timestamp.
2. **Authentication**: Verifying the user's identity or checking if they have the necessary permissions to access certain resources.
3. **Error handling**: Handling and responding to errors that occur during the request-response cycle.
4. **Data parsing**: Parsing request data, such as form data or JSON payloads, before handling them in route handlers.
5. **CORS (Cross-Origin Resource Sharing)**: Implementing cross-origin access controls to restrict or allow access from different domains.
6. **Compression**: Compressing response data to reduce network bandwidth usage.

Express provides a set of built-in middleware functions that cover common use cases. Additionally, you can create your own custom middleware functions to suit the specific needs of your application.

## Using Built-in Middleware

Express comes with several built-in middleware functions that can be easily integrated into your application. These functions can be used individually or combined to create a middleware stack.

### Example: Logging Middleware

One of the commonly used built-in middleware functions in Express is the logging middleware. It logs details about each incoming request to the server console. Here's an example of how to use it:

```javascript
const express = require("express");
const app = express();

// Logging middleware
app.use((req, res, next) => {
  console.log(`[${new Date().toLocaleString()}] ${req.method} ${req.url}`);
  next();
});

// Route handler
app.get("/", (req, res) => {
  res.send("Hello, Express!");
});

app.listen(3000, () => {
  console.log("Server started on port 3000");
});
```

In the above example, the logging middleware is added using `app.use()` before defining the route handler. It logs the current timestamp, request method, and URL to the console for every incoming request.

### Example: Parsing JSON Middleware

Express provides a middleware function called `express.json()` for parsing JSON data sent in the request body. Here's an example of how to use it:

```javascript
const express = require("express");
const app = express();

// JSON parsing middleware
app.use(express.json());

// Route handler
app.post("/api/users", (req, res) => {
  // Access the parsed JSON data
  console.log(req.body);
  res.send("User created successfully!");
});

app.listen(3000, () => {
  console.log("Server started on port 3000");
});
```

In this example, the `express.json()` middleware is used to parse incoming JSON data. It populates the `req.body` object with the parsed JSON, which can then be accessed in the route handler.

## Creating Custom Middleware

In addition to the built-in middleware, Express allows you to create your own custom middleware functions. Custom middleware functions give you the flexibility to implement application-specific logic and handle specific requirements.

A custom middleware function follows the same structure as any other middleware function. It takes three parameters: `req` (request object), `res` (response object), and `next` (a callback function to invoke the next middleware function in the chain).

### Example: Authentication Middleware

Let's create a custom middleware function for authentication. It checks if the request contains a valid API key in the headers and allows or denies access accordingly:

```javascript
const express = require("express");
const app = express();

// Custom authentication middleware
const authenticate = (req, res, next) => {
  const apiKey = req.headers["x-api-key"];

  if (apiKey === "secretapikey") {
    next(); // Allow access to the next middleware or route handler
  } else {
    res.status(401).send("Unauthorized"); // Deny access
  }
};

// Using the custom middleware
app.use(authenticate);

// Route handler
app.get("/api/protected", (req, res) => {
  res.send("Welcome to the protected area!");
});

app.listen(3000, () => {
  console.log("Server started on port 3000");
});
```

In the above example, the `authenticate` middleware function checks if the request header contains a valid API key. If the key is correct (`'secretapikey'` in this case), it calls `next()` to allow access to the `/api/protected` route handler. Otherwise, it responds with a `401 Unauthorized` status.

## Conclusion

In this tutorial, we covered the basics of using middleware in Express. We explored the concept of middleware, discussed its significance, and learned how to use both built-in middleware and custom middleware in Express applications. By leveraging middleware effectively, you can enhance the functionality, security, and performance of your web applications.

{: .prompt-info }

> Middleware functions execute in the order they are added, so the order of middleware registration is important. Start integrating middleware into your Express applications and unlock the power of modularity and extensibility in your web development projects.

Happy coding!
