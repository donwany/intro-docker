FROM python:3.12-slim-bullseye

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

# RUN pip install uvicorn fastapi

COPY . .

CMD ["python", "app.py"]