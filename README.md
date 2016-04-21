# API сервер "ЄДР"

Тестовий сервер: http://edr.data-gov-ua.org/

## Розгортання локально (Docker)

1. Клонуйте репозиторій
2. Завантажте ЄДР-файл `ou.csv` у папку `data/` (можна створити сімлінку на папку із файлом за допомогою `ln -s`)
3. Встановіть `docker` та `docker-compose` щонайменше версії 1.10
4. Запустіть `docker-compose build && docker-compose up`
5. Ждіть закінчення імпорту даних

## Розгортання на сервері (Docker Cloud)

1. Зареєструйтесь на Docker Cloud та прилінкуйте сервер
2. Створіть стек за допомогою цього `Stackfile`:
```
edr:
  image: 'vanuan/edrpou-api:latest'
  environment:
    - NODE_ENV=production
    - PORT=80
  links:
    - mongo
  ports:
    - '80:80'
mongo:
  image: 'mvertes/alpine-mongo:latest'
```
3. Ждіть завершення розгортання

## Використання

Документація доступна за посиланням:
http://edr.data-gov-ua.org/docs/
