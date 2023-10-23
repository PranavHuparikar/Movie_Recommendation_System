FROM python:3.9

# Set the working directory to /app
WORKDIR /app

# Copy the local requirements.txt and app.py files to the container
COPY . /app

# Create a virtual environment and activate it
RUN python -m venv venv
RUN /bin/bash -c "source venv/bin/activate"

# Install any necessary dependencies within the virtual environment
RUN venv/bin/python -m pip install --upgrade pip
RUN venv/bin/python -m pip install -r requirements.txt

# Expose the port on which Streamlit runs
EXPOSE 8502

# Set the entrypoint to run the Streamlit app
CMD ["venv/bin/streamlit", "run", "--server.port", "8502", "--server.enableCORS", "true", "app.py"]
