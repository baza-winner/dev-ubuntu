
# Описание

Проект по сборке базового образа `dev-ubuntu`, используемого в dev-docker-контейнерах проектов [baza-winner](https://github.com/baza-winner)

# Настройка окружения

1. [Установить команду bw](https://github.com/baza-winner/bw/wiki)

2. Развернуть рабочее место проекта `dubu` (`dev-ubuntu`)

```
bw project dubu
```
 
# Использование

## Сборка образа

```
dubu docker build
```

## Push образа

```
_docker login
dubu docker push
```
