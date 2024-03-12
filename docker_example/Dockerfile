FROM python:3.10-slim

# Install necessary system dependencies
RUN apt-get update && apt-get install -y gcc g++ git make sudo && apt-get clean && rm -rf /var/lib/apt/lists/*

# Add a new user and grant sudo permissions
RUN useradd -m -u 1000 user && usermod -aG sudo user

# Switch to the newly created user
USER user

# Set environment variables
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH

# Set the working directory
WORKDIR $HOME/app

# Copy the application files into the container
COPY --chown=user . $HOME/app

# Install langflow using sudo
RUN sudo pip install langflow>=0.5.0

# Set the command to run when the container starts
CMD ["python", "-m", "langflow", "run", "--host", "0.0.0.0", "--port", "7860"]
