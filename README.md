# API сервер "ЄДР"

## Вcтановлення

1. Клонуйте репозиторій
2. Завантажте ЄДР-файл `ou.csv` у папку `data/` (можна створити сімлінку на папку із файлом за допомогою `ln -s`)
3. Встановіть `docker` та `docker-compose` щонайменше версії 1.10
4. Запустіть `docker-compose build && docker-compose up`
5. Ждіть закінчення імпорту даних

## Використання

Приклад використання:

```
http://localhost:81/company?limit=5&skip=120000&sort=id&populate=id,name
```

Розширена документація: http://sailsjs.org/documentation/reference/blueprint-api/find-where
