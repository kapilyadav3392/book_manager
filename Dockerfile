
FROM python:3.11-slim


ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


WORKDIR /app


COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt


COPY . /app/


RUN mkdir -p /app/staticfiles
RUN python manage.py collectstatic --noinput || echo "Skipping collectstatic"


EXPOSE 8000


CMD ["sh", "-c", "python manage.py migrate && gunicorn book_manager.wsgi:application --bind 0.0.0.0:8000"]
