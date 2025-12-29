---
title: "How to Work with Cookies in Express"
image:
  path: /assets/img/how-to-work-with-cookies-in-express/how-to-work-with-cookies-in-express-p.png
author: vivek
date: 2023-06-25 13:00:00 +0530
categories: [Web Development]
tags: [Express, Cookies, Node.js]
description: Learn how to work with cookies in Express to manage user sessions and store data in a web application.
pin: false
---

Cookies are small text files that are stored on a user's computer by a web server. They are commonly used to store user-specific information and track user activities. In Express, a popular web application framework for Node.js, working with cookies is straightforward and can be done using various middleware and methods provided by the framework.

In this tutorial, we will explore how to work with cookies in Express, including setting and retrieving cookies, managing cookie options, and handling cookie-based sessions.

## Setting Cookies

To set a cookie in Express, you can use the `res.cookie()` method provided by the response object (`res`). The `res.cookie()` method takes a name-value pair as arguments and attaches the cookie to the response object. Here's an example:

```javascript
app.get("/set-cookie", (req, res) => {
  res.cookie("username", "John Doe");
  res.send("Cookie set!");
});
```

In the above example, when a user visits the `/set-cookie` route, the server sets a cookie named `username` with the value `John Doe`. The cookie will be sent to the user's browser along with the response.

## Retrieving Cookies

To retrieve a cookie in Express, you can use the `req.cookies` object, which is populated by the `cookie-parser` middleware. This middleware parses the cookies sent by the browser and makes them available in the `req.cookies` object.

```javascript
app.get("/get-cookie", (req, res) => {
  const username = req.cookies.username;
  res.send(`Hello, ${username}!`);
});
```

In the above example, the server retrieves the value of the `username` cookie from the `req.cookies` object and sends a personalized greeting using the retrieved value.

## Managing Cookie Options

Cookies can have various options to control their behavior, such as expiration date, path, domain, secure flag, and more. Express provides flexibility in managing these options when setting cookies.

```javascript
app.get("/set-cookie-options", (req, res) => {
  const cookieOptions = {
    maxAge: 60 * 60 * 1000, // Cookie expires after 1 hour
    path: "/dashboard", // Cookie only accessible on '/dashboard' route
    secure: true, // Cookie sent over HTTPS only
  };

  res.cookie("session-id", "123456", cookieOptions);
  res.send("Cookie set with options!");
});
```

In the above example, the server sets a cookie named `session-id` with the value `123456`. The cookie has additional options specified in the `cookieOptions` object. These options ensure that the cookie expires after 1 hour, is only accessible on the `/dashboard` route, and is sent over HTTPS.

## Cookie-based Sessions

One common use case of cookies is to implement session management in web applications. A session is a way to store user-specific data between multiple requests. Express provides middleware like `express-session` that simplifies session management using cookies.

```javascript
const session = require('express-session');

app.use(session({
  secret: 'your-secret-key',
  resave: false,
  saveUninitialized: true
}));

app.get('/login', (req, res) => {
  req.session.username = 'John

 Doe';
  res.send('Logged in!');
});

app.get('/dashboard', (req, res) => {
  const username = req.session.username;
  res.send(`Welcome to the dashboard, ${username}!`);
});
```

In the above example, the `express-session` middleware is used to manage sessions. The `secret` option specifies a secret key used to sign the session cookie, providing security. The `req.session` object is used to store and retrieve session-specific data. In the `/login` route, the server sets the `username` property of the session object, and in the `/dashboard` route, it retrieves and uses the `username` value.

I hope this tutorial helped you understand how to work with cookies in Express. Cookies are a powerful tool for managing user sessions and storing user-specific information in web applications.
