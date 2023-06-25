---
title: "How to Create a Basic Express Application"
image:
  path: /assets/img/basic-express-application/basic-express-application-p.png
author: vivek
date: 2023-05-07 13:00:00 +0530
categories: [Web Development]
tags: [Express, Node.js, Backend Development]
description: Learn how to create a basic Express application using Node.js to build powerful web applications.
pin: false
---

Express is a fast and minimalist web application framework for Node.js. It provides a robust set of features to develop web applications quickly and easily. In this tutorial, we will learn how to create a basic Express application from scratch.

## Prerequisites

To follow along with this tutorial, you should have the following installed on your system:

Node.js: Make sure you have Node.js installed. You can download it from the official [Node.js](https://nodejs.org) website and follow the installation instructions for your operating system.

## Step 1: Initialize the Project

The first step is to create a new directory for your Express application and navigate to that directory using the command line. Open your terminal or command prompt and run the following command:

```bash
mkdir express-app
cd express-app
```

## Step 2: Initialize a Node.js Project

Next, we need to initialize a new Node.js project in our `express-app` directory. Run the following command to create a `package.json` file:

```bash
npm init -y
```

This command will create a `package.json` file with default values. The `package.json` file is used to manage dependencies and configuration for our project.

## Step 3: Install Express

Now, let's install Express as a dependency for our project. Run the following command:

```bash
npm install express
```

This command will download and install the latest version of Express from the npm registry.

## Step 4: Create the Express Application

Once the installation is complete, let's create a new file called `app.js` in the `express-app` directory. This file will contain the code for our Express application.

Open `app.js` in a text editor and add the following code:

```javascript
const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("Hello, World!");
});

app.listen(3000, () => {
  console.log("Server started on port 3000");
});
```

In this code, we import the Express module, create an instance of the Express application, define a route for the root URL (`'/'`), and send a response with the text "Hello, World!". Finally, we start the server and listen on port 3000.

## Step 5: Start the Express Application

To start the Express application, go to your terminal or command prompt and run the following command:

```bash
node app.js
```

You should see the message "Server started on port 3000" in the console. This means your Express application is running successfully.

![Desktop View](/assets/img/basic-express-application/console-output-1.png){: width="972" height="589" }

## Step 6: Test the Express Application

Open your web browser and visit [http://localhost:3000](http://localhost:3000). You should see the text "Hello, World!" displayed on the page.

Congratulations! You have successfully created and tested a basic Express application.

## Exercise

Now that you have learned how to create a basic Express application, here's an exercise for you:

1. Create a new route in your Express application that responds with a JSON object containing information about your favorite book.
2. Add a new route that accepts a parameter indicating a person's name and responds with a personalized greeting for that person.

You can use the [Express documentation](https://expressjs.com) as a reference to complete this exercise.

Remember to test your application after making the changes. Good luck!

In this tutorial, we learned how to create a basic Express application from scratch. We covered initializing the project, installing Express, creating the Express application, starting the application, and testing it. Express provides many more powerful features that you can explore to build robust and scalable web applications.

Happy coding!
