# Update and install dependencies
RUN apt-get update && \
    apt-get install -y portaudio19-dev python3-dev
FROM python:3.9-slim

# Install PortAudio and dependencies
RUN apt-get update && apt-get install -y \
    portaudio19-dev \
    python3-dev \
    gcc \
    g++ \
    make \
    && rm -rf /var/lib/apt/lists/*

# Set up the working directory
WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the rest of your app
COPY . .

CMD ["python", "your_app.py"]
