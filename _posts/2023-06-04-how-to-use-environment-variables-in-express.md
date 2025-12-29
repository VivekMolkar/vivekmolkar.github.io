---
title: "How to Use Environment Variables in Express"
image:
  path: /assets/img/how-to-use-environment-variables-in-express/how-to-use-environment-variables-in-express-p.png
author: vivek
date: 2023-06-04 09:00:00 +0000
categories: [Web Development]
tags: [Node.js, Express.js, Environment Variables]
description: Learn how to use environment variables in an Express.js application to manage sensitive data and configuration settings.
pin: false
---

In web development, it is common to have sensitive information and configuration settings that should not be hard-coded directly into the source code. Examples of such sensitive data include database connection strings, API keys, and authentication credentials. To keep this information secure and separate from the codebase, we can make use of environment variables.

Environment variables are dynamic values that can be set on the operating system or within the execution environment. They provide a way to store configuration settings outside of the application's code and can be accessed by the application at runtime.

In this tutorial, we will learn how to use environment variables in an Express.js application. We will explore how to set up and access environment variables, and see some practical examples of their usage.

## Setting Up Environment Variables

To begin using environment variables in an Express.js application, follow these steps:

### Step 1: Install the `dotenv` package

The `dotenv` package allows us to load environment variables from a `.env` file into `process.env`. Start by installing it using npm:

```shell
npm install dotenv
```

### Step 2: Create a `.env` file

Create a new file in the root directory of your Express.js project called `.env`. This file will hold your environment variables in a key-value format.

```plaintext
DATABASE_URL=mongodb://localhost/mydatabase
API_KEY=your_api_key_here
```

Note that the values assigned to the variables should not be surrounded by quotes.

### Step 3: Load environment variables

To load the environment variables from the `.env` file, require the `dotenv` package at the beginning of your application's entry point file. Typically, this is the file where you initialize your Express.js app (e.g., `index.js` or `app.js`).

```javascript
require("dotenv").config();
```

This will load the variables defined in the `.env` file into `process.env`, making them accessible throughout your application.

## Accessing Environment Variables

Once the environment variables are loaded, you can access them using the `process.env` object. For example, if you have a variable named `DATABASE_URL`, you can access its value as follows:

```javascript
const dbUrl = process.env.DATABASE_URL;
console.log(dbUrl); // Output: mongodb://localhost/mydatabase
```

You can use the variables in any part of your Express.js application where they are needed, such as connecting to a database or using an API key.

## Practical Examples

Let's explore a couple of practical examples to see how environment variables can be used in an Express.js application.

### Example 1: Database Configuration

Suppose you have an Express.js application that needs to connect to a MongoDB database. Instead of hard-coding the database connection string in your code, you can store it as an environment variable.

1. Create a `.env` file and add the following line:

```plaintext
DATABASE_URL=mongodb://localhost/mydatabase
```

2. In your Express.js application, access the database URL using the environment variable:

```javascript
const mongoose = require("mongoose");
const dbUrl = process.env.DATABASE_URL;

mongoose
  .connect(dbUrl, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log("Connected to the database");
  })
  .catch((error) => {
    console.error("Error connecting to the database:", error);
  });
```

### Example 2: API Key

Suppose you are integrating your Express.js application with a third-party API that requires an API key. Instead of exposing the API key directly in your code, you can store it as an environment variable.

1. Create a `.env` file and add the following line:

```plaintext
API_KEY=your_api_key_here
```

2. In your Express.js application, access the API key using the environment variable:

```javascript
const axios = require("axios");
const apiKey = process.env.API_KEY;

axios
  .get("https://api.example.com/data", {
    headers: {
      Authorization: `Bearer ${apiKey}`,
    },
  })
  .then((response) => {
    console.log("API response:", response.data);
  })
  .catch((error) => {
    console.error("Error fetching data from API:", error);
  });
```

## Exercise

Now it's time to test your understanding of using environment variables in Express.js. Here's a simple exercise for you:

**Exercise:** Create an Express.js application that uses environment variables to store the following information:

- Database connection string (`DATABASE_URL`)
- Secret key for session management (`SESSION_SECRET`)

1. Set up the `dotenv` package and load the environment variables from a `.env` file.
2. Connect to a MongoDB database using the `DATABASE_URL` environment variable.
3. Use the `SESSION_SECRET` environment variable as the secret key for session management in Express.js.
4. Implement a route that retrieves some data from the database and returns it as a response.

You can test your application by starting the server and accessing the route using a web browser or a tool like cURL.

---

By following the steps and examples outlined in this tutorial, you should now have a good understanding of how to use environment variables in an Express.js application.

{: .prompt-warning }

> Remember to always keep sensitive information separate from your codebase for better security and flexibility.

Happy coding!
