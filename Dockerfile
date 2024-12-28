# Use the official Python slim image
FROM python:3.12-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

# Install system dependencies and Chrome
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    unzip \
    fonts-liberation \
    libasound2 \
    libnss3 \
    libnspr4 \
    libx11-xcb1 && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt-get install -y ./google-chrome-stable_current_amd64.deb && \
    rm -f google-chrome-stable_current_amd64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Specify the default command to run the Python script
CMD ["python", "python.py"]
