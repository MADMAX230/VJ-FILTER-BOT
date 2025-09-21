

# Use a stable Python 3.10 image
FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .

# Install system dependencies
RUN apt update && apt upgrade -y && apt install -y git ffmpeg && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Expose port if using webhooks
EXPOSE 8000

# Command to run your bot
CMD ["python", "bot.py"]
