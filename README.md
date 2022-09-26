# Weather Api

[![Test and Linter Check](https://github.com/usernaimandrey/weather_api/actions/workflows/CI.yml/badge.svg)](https://github.com/usernaimandrey/weather_api/actions/workflows/CI.yml)

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)

Простое API для получения данных о погоде в Москве

End points:

1. v1/weather/historical/max - Максимальная темперетура за 24 часа

2. v1/weather/historical/min - Минимальная темперетура за 24 часа

3. v1/weather/historical/avg - Средняя темперетура за 24 часа

4. v1/weather/by_time - находит температуру ближайшую к переданному timestamp

5. v1/health - Статус бекенда

6. v1/weather/current - Текущая температура

7. v1/weather/historical - Почасовая температура за последние 24

Развернуть приложение:

1. склонируйте репозиторий:
  ```bash
  $ git clone https://github.com/usernaimandrey/weather_api.git

  ```

2. перейдите в директорию приложения:
  ```
  $ cd weather_api/
  ```
3. установите зависимости:

  ```
  $ make setup
  ```
4. пропишите в файле .ENV ключ от [стороннего api](https://developer.accuweather.com/)

5. Запустите приложение:
  ```
  $ make start
 ```
6. запустите worker:

  ```
  $ start-jobs
  ```
7. Запустите тесты:

  ```
  $ make test
  ```