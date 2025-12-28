FROM python:3.11-slim

WORKDIR /app

COPY docker-python-app-code/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY docker-python-app-code/app.py .

EXPOSE 5000

CMD ["python", "app.py"]