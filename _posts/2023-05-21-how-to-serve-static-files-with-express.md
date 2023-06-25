---
title: "How to Serve Static Files with Express"
author: vivek
date: 2023-05-21 10:00:00 +0530
categories: [Web Development]
tags: [Express.js, Static Files, Middleware]
description: Learn how to serve static files using Express.js, a popular Node.js framework. Understand the importance of middleware and how to configure Express to handle static file requests.
pin: false
---

When building web applications, it's common to have static files such as CSS, JavaScript, images, or HTML files that need to be delivered to the client. Express.js, a powerful web framework for Node.js, provides a simple and efficient way to serve these static files.

In this tutorial, we'll explore how to configure Express.js to handle static file requests and serve them to the client. We'll cover the necessary setup, explain the concept of middleware, and provide practical examples to help you understand the process.

## Prerequisites

To follow along with this tutorial, you should have a basic understanding of Node.js and Express.js. It's also helpful to have [Node.js](https://nodejs.org/en) and [npm](https://www.npmjs.com/) (Node Package Manager) installed on your machine.

## Setting Up Express.js

To get started, create a new Node.js project and install the Express.js package by running the following commands in your terminal:

```bash
mkdir static-files-express
cd static-files-express
npm init -y
npm install express
```

You can also follow the tutorial at [Create a Basic Express Application](/posts/basic-express-application)

Once you've set up the project and installed Express.js, create a new file named `app.js` and open it in your favorite text editor.

## Configuring Express.js to Serve Static Files

To serve static files with Express.js, we need to use the built-in `express.static` middleware function. This function takes the root directory of the files we want to serve as a parameter.

In your `app.js` file, add the following code:

```javascript
const express = require("express");
const app = express();

// Serve static files
app.use(express.static("public"));

// Start the server
app.listen(3000, () => {
  console.log("Server is running on http://localhost:3000");
});
```

In the above code, we first import the Express.js module and create an instance of the Express application. Then, we use the `app.use` method to add the `express.static` middleware, passing it the name of the directory where our static files are located (in this case, `public`).

The `express.static` middleware function will automatically serve any files in the specified directory when their URLs are requested. For example, if you have a file named `styles.css` in the `public` directory, you can access it in the browser by visiting `http://localhost:3000/styles.css`.

## Understanding Middleware

[Middleware functions](/posts/how-to-use-middlewares-with-express) in Express.js are functions that have access to the request object (`req`), the response object (`res`), and the `next` middleware function in the application's request-response cycle. Middleware functions can perform various tasks such as modifying the request or response objects, terminating the request-response cycle, or calling the `next` middleware function.

In our case, the `express.static` middleware is responsible for serving the static files. When a request is made for a static file, Express.js first checks if the requested file exists in the specified directory. If it does, the middleware sends the file back to the client; otherwise, it passes control to the next middleware function.

It's important to note that the order in which middleware functions are added using `app.use` matters. Express.js processes them in the order they are defined, so make sure to add the `express.static` middleware before any routes or other middleware functions that might handle the same URL.

## Practical Examples

Let's look at a couple of practical examples to solidify our understanding.

### Example 1: Serving an HTML File

Assume we have an HTML file named `index.html` in the `public` directory. To serve this file, we can simply visit `http://localhost:3000/index.html` in the browser, and Express.js will send the `index.html` file to the client.

### Example 2: Serving an Image

Suppose we have an image named `logo.png` in the `public/images` directory. To serve this image, we can access it in the browser by visiting `http://localhost:3000/images/logo.png`. Express.js will automatically send the `logo.png` image to the client.

## Exercise: Serving a CSS File

Now it's your turn to practice serving a CSS file using Express.js.

1. Create a new CSS file named `styles.css` in the `public` directory.
2. Add some CSS styles of your choice to the `styles.css` file.
3. Configure Express.js to serve static files as shown in the previous examples.
4. Start the server and access the CSS file in the browser.
5. Verify that the CSS styles are applied correctly to an HTML page.

## Conclusion

In this tutorial, you learned how to serve static files using Express.js. We explored the configuration process, discussed the concept of middleware, and provided practical examples to help you grasp the concept.

By following the steps outlined in this tutorial, you can efficiently deliver static files to clients and enhance the functionality of your Express.js applications.

Remember to practice serving various types of static files, such as images, JavaScript files, and HTML files, to further solidify your understanding. Happy coding!

**Further Resources:**

- [Express.js Documentation](https://expressjs.com/)
- [Middleware in Express.js](https://expressjs.com/en/guide/using-middleware.html)
- [Static Files in Express.js](https://expressjs.com/en/starter/static-files.html)
