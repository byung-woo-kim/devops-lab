FROM python:3.9-slim

WORKDIR /app
COPY app.py .
COPY test_app.py .

RUN pip install pytest

CMD ["python", "app.py"]

