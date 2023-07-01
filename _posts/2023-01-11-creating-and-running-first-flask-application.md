---
title: "Creating and Running Your First Flask Application"
image:
  path: /assets/img/creating-and-running-first-flask-application/creating-and-running-first-flask-application-p.png
author: vivek
date: 2023-01-11 13:00:00 +0530
categories: [Programming]
tags: [Python, Flask, Web Development]
description: Learn how to create and run your first Flask application using Python.
pin: false
---

Flask is a popular web framework for building web applications using Python. It provides a simple and flexible way to create web applications by following the Model-View-Controller (MVC) architectural pattern. In this tutorial, we will learn how to create and run your first Flask application.

## Importing Flask and Creating an App Instance

{: .prompt-info }

> **Note:** This tutorial assumes that you have Python installed on your system. You can refer to our tutorial on [setting up a Flask development environment](/posts/setting-up-flask-development-environment/) for more information.

To get started with Flask, we need to install it first. You can install Flask using `pip`, the package installer for Python, by running the following command in your terminal:

```
pip install flask
```

Once Flask is installed, we can create a new Python file and import the Flask module. Here's an example:

```python
from flask import Flask
```

Next, we need to create an instance of the Flask class. This instance will be our application object. We can do this by calling the `Flask()` constructor:

```python
app = Flask(__name__)
```

In the above code, `__name__` is a special Python variable that represents the name of the current module. It is used by Flask to locate resources such as templates and static files.

## Defining Routes and Their Corresponding Functions

In Flask, a route maps a URL to a function that handles the request made to that URL. We can define routes using the `@app.route()` decorator. Here's an example:

```python
@app.route('/')
def index():
    return 'Hello, Flask!'
```

In the above code, we define a route for the root URL ("/") and associate it with a function named `index()`. This function will be called when a user visits the root URL, and it should return the response that will be sent back to the user's browser. In this case, we simply return the string "Hello, Flask!".

We can define additional routes by adding more decorated functions to our application file. Each function should correspond to a specific URL pattern.

## Running the Flask Application

To run a Flask application, we need to add a few lines of code at the end of our file. Here's an example:

```python
if __name__ == '__main__':
    app.run()
```

The `if __name__ == '__main__'` condition ensures that the Flask development server is only started if the script is executed directly, not imported as a module. This is important because we want the server to run when we run our application file, but not when we import it into other files.

By calling `app.run()`, Flask will start the development server on your local machine. You should see some output in your terminal indicating that the server is running. By default, the server will listen on port 5000.

You can access your Flask application by opening a web browser and navigating to `http://localhost:5000` or `http://127.0.0.1:5000`. You should see the "Hello, Flask!" message displayed in the browser.

That's it! You have created and run your first Flask application.

## Frequently Asked Questions (FAQs)

**Q: What is Flask?**<br>
**A:** Flask is a web framework for building web applications using the Python programming language. It provides a simple and flexible way to create web applications by following the Model-View-Controller (MVC) architectural pattern.

**Q: How do I install Flask?**<br>
**A:** You can install Flask using `pip`, the package installer for Python, by running the command `pip install flask` in your terminal.

**Q: What is a route in Flask?**<br>
**A:** In Flask, a route maps a URL to a function that handles the request made to that URL. Routes are defined using the `@app.route()` decorator.

**Q: What is the purpose of the `__name__` variable in Flask?**<br>
**A:** The `__name__` variable is a special Python variable that represents the name of the current module. It is used by Flask to locate resources such as templates and static files.

**Q: How do I run a Flask application?**<br>
**A:** To run a Flask application, you need to add the code `if __name__ == '__main__': app.run()` at the end of your file. Then, you can execute your application file, and Flask will start the development server.

**Q: How can I access my Flask application in a web browser?**<br>
**A:** You can access your Flask application by opening a web browser and navigating to `http://localhost:5000` or `http://127.0.0.1:5000`. This is the default URL where the Flask development server listens for requests.

**Q: Can I use a different port for the Flask development server?**<br>
**A:** Yes, you can specify a different port by passing the `port` parameter to the `app.run()` method. For example, `app.run(port=8080)` will start the server on port 8080.

**Q: How do I stop the Flask development server?**<br>
**A:** You can stop the Flask development server by pressing `Ctrl + C` in your terminal. This will terminate the server and stop it from listening for requests.

Remember, practice is key to mastering Flask. Experiment with different routes and functions, and explore the rich features and extensions that Flask offers. Happy coding!

## References:

- [Flask Official Documentation](https://flask.palletsprojects.com/) - The official documentation for Flask, providing comprehensive information and tutorials.
