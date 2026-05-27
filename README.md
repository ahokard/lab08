## Laboratory work VIII

Данная лабораторная работа посвящена изучению систем автоматизации развёртывания и управления приложениями на примере Docker.

### Goal

Изучить контейнеризацию C++ приложения с использованием Docker.

### Tasks

1. Создан публичный репозиторий `lab08`
2. Проект перенесён из предыдущей лабораторной работы
3. Создан `Dockerfile`
4. Настроена сборка проекта внутри Docker контейнера
5. Настроено подключение тома для хранения логов
6. Выполнен запуск контейнера
7. Проверена работа приложения внутри контейнера
8. Настроен CI для автоматической проверки Docker-сборки

### Files

#### Dockerfile

```dockerfile
FROM ubuntu:18.04

RUN apt update
RUN apt install -yy gcc g++ cmake

COPY . print/
WORKDIR print

RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install
RUN cmake --build _build
RUN cmake --build _build --target install

ENV LOG_PATH /home/logs/log.txt

VOLUME /home/logs

WORKDIR _install/bin

ENTRYPOINT ./demo
```

### Build

Сборка Docker-образа:

```bash
docker build -t logger .
```

Запуск контейнера:

```bash
mkdir logs
docker run -it -v "$(pwd)/logs/:/home/logs/" logger
```

Проверка логов:

```bash
cat logs/log.txt
```

### Result

В ходе лабораторной работы была изучена контейнеризация приложений с использованием Docker, сборка C++ проекта внутри контейнера и подключение постоянного хранилища для логов.

### Links

- Repository: https://github.com/ahokard/lab08

## CI Status

[![CI](https://github.com/ahokard/lab04/actions/workflows/ci.yml/badge.svg)](https://github.com/ahokard/lab04/actions)
