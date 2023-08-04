# Use the official Python base image
FROM python:3.8

# Set environment variables
ENV STATIC_PATH=/single_data/download/clash_sub

# Install poetry
RUN pip install --no-cache-dir poetry

# Copy poetry.lock/pyproject.toml to the container
WORKDIR /app
COPY pyproject.toml poetry.lock ./

# Install project dependencies
RUN poetry config virtualenvs.create false \
    && poetry install --no-dev --no-interaction --no-ansi

# Copy the app code to the container
COPY app.py .

# Expose the port on which the app will run
EXPOSE 8000

# Start the uvicorn server
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
