# API сервер "ЄДР"

## Розгортання локально з GitHub

1. Клонуйте репозиторій
2. Завантажте ЄДР-файл `ou.csv` у папку `data/` (можна створити сімлінку на папку із файлом за допомогою `ln -s`)
3. Встановіть `docker` та `docker-compose` щонайменше версії 1.10
4. Запустіть `docker-compose build && docker-compose up`
5. Ждіть закінчення імпорту даних

## Розгортання на сервері за допомогою Docker Cloud та Docker Hub

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

Приклад використання:

```
http://$SERVER/company?limit=5&skip=120000&sort=id&populate=id,name
```

Розширена документація: http://sailsjs.org/documentation/reference/blueprint-api/find-where
