#FROM ubuntu:latest
FROM python:3.8.13-slim
LABEL authors="tyler"

EXPOSE 5002

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app
COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["gunicorn", "--bind", "0.0.0.0:5002", "main:app"]
