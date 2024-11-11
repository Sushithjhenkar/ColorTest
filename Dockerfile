# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt ./

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container
COPY . .

# Expose port 8080 to match Cloud Run's default port
EXPOSE 8080

# Define environment variable for Flask
ENV PYTHONUNBUFFERED=1
ENV PORT=8080

# Run the application
CMD ["python", "main.py"]
