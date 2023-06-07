# Use the official Python 3 base image
FROM python:3

# Set the working directory inside the container
WORKDIR /app

# Install Flask library using pip
RUN pip install flask

# Copy the app.py file from the local directory to the working directory inside the container
COPY app.py /app/

# Expose port 3000 to allow external access
EXPOSE 3000

# Set the command to run when the container starts
CMD [ "python", "./app.py" ]
