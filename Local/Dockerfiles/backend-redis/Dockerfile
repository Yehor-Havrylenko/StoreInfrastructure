FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    python3-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY cloned/backend_redis/requirements.txt .

RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

COPY cloned/backend_redis .

EXPOSE 5001

CMD ["python", "manage.py", "runserver", "0.0.0.0:5001"]
