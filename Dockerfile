FROM docker.io/python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cahce-dir -r requirements.txt
COPY . .
ENV FLASK_APP=app.python
ENV FLASK_ENV=production
EXPOSE 5000
RUN useradd -m appuser
USER appuserCMD ["gunicorn", "--bind" "0.0.0.0:5000", "app:app"]