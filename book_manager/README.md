# 📚 Book Manager API

A Django REST Framework project to manage books with JWT authentication.  
Dockerized for easy setup with PostgreSQL as the database.

---

## 🚀 Features
- Django REST Framework-based API
- JWT Authentication (using `djangorestframework-simplejwt`)
- PostgreSQL as database
- Docker & Docker Compose support
- Environment variable configuration using `.env`

---

## ✅ Prerequisites
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

---

## ⚙️ Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/kapilyadav3392/book_manager.git
cd book-manager

2. Create Environment File

Copy the example file:

cp .env.example .env

3. Build and Start Containers

docker-compose up --build


This will start:

web (Django app)
db (PostgreSQL)

4. Run Database Migrations

In a separate terminal:

docker-compose exec web python manage.py migrate


5. Collect Static Files

docker-compose exec web python manage.py collectstatic --noinput

Access the App using this root

http://localhost:8000/api/
http://127.0.0.1:8000/api/

🔑 JWT Authentication
Obtain Token (cURL)

curl -X POST http://127.0.0.1:8000/api/token/ \
  -H "Content-Type: application/json" \
  -d '{"username": "your-username", "password": "your-password"}'

  Response:

{
  "refresh": "<refresh_token>",
  "access": "<access_token>"
}

Use Token in Requests

Add this header to all API requests:

Authorization: Bearer <access_token>



📚 Example API Requests

List All Books(cURL)

curl -X GET http://127.0.0.1:8000/api/books/ \
  -H "Authorization: Bearer <access_token>"

Create a Book(cURL)

curl -X POST http://127.0.0.1:8000/api/books/ \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <access_token>" \
  -d '{
        "title": "Django for Beginners",
        "author": "William S. Vincent",
        "published_date": "1925-04-10",
        "is_available": true
      }'


🛠 Environment Variables (.env)

Create a .env file with the following:

POSTGRES_DB=BookManageDB
POSTGRES_USER=postgres
POSTGRES_PASSWORD=123456
DATABASE_HOST=db
DATABASE_PORT=5432
DJANGO_SECRET_KEY=django-insecure-<your-key>
DEBUG=True
DJANGO_ALLOWED_HOSTS=127.0.0.1,localhost



Docker Commands

Start containers 
docker-compose up --build

Stop containers
docker-compose down

Run migrations
docker-compose exec web python manage.py migrate

provided ✅ Postman Collection in .json