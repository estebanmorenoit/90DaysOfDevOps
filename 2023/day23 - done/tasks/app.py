# app.py

# Importing the Flask class from the flask module
from flask import Flask

# Creating an instance of the Flask application
app = Flask(__name__)

# Defining a route decorator for the root URL ("/")
@app.route('/')
def hello():
    # Returning the string "Hello, World!" as the response to the request
    return "Hello, World!"

# Checking if the script is being executed directly (not imported as a module)
if __name__ == '__main__':
    # Running the Flask application
    # Starts a development server on the specified host (0.0.0.0) and port (3000) to handle incoming requests
    app.run(host='0.0.0.0', port=3000)
