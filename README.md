# Project-1

## Установка (Ubuntu 16.04 или выше)

1. Устанавливаем на локальной машине необходимые пакеты:

    sudo -s
    apt update && apt install docker.io make

2. Генерируем и копируем ключи на удаленный хост:

    ssh-keygen -t rsa
    ssh-copy-id root@*remote-ip-addr*

3. Устанавливаем на удаленном хосте Docker:

    ssh root@*remote-ip-addr* "apt update && apt install docker.io"

4. Копируем на локальную машину файлы из репозитория:

    git clone https://github.com/volt-80386/Project-1 /srv

## Эксплуатация
    
    cd /srv
   
1. Скачиваем html-файлы с внешнего web-сервера:

    make sync

2. Создаем Docker-контейнер c html-файлами и локальным web-сервером:

    make build

3. Деплоим контейнер на удаленную машину

    make deploy

## Автоматизируем пункты 1-3:

    cd /srv
    crontab crontab
    *(запуск по субботам в 3:45)*
