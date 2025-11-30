FROM python:3.10

# Створюємо робочу директорію
WORKDIR /app

# Копіюємо requirements
COPY requirements.txt /app/

# Встановлюємо залежності
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо увесь проєкт
COPY . /app/

# Запуск Django сервера
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

