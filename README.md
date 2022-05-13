# Project-1

# Задание: 
https://github.com/SkillfactoryCodingTeam/devops__project__automation

# Решение:

## Установка

1. Устанавливаем на локальной машине необходимые пакеты:
    <pre>
    sudo -s
    apt update && apt install docker.io make dpkg-repack
    </pre>
    
2. Запускаем Docker:
   <pre>
   systemctl enable docker && systemctl start docker
   </pre>

2. Генерируем и копируем ключи на удаленный хост:
   <pre>
   ssh-keygen -t rsa
   ssh-copy-id root@<i>remote-ip-addr</i>
   </pre>

3. Устанавливаем и запускаем Docker на удаленном хосте:

   *Так как в задании на удаленной машине нет интернета, то собираем на локальной машине, а, затем, копируем на удаленную необходимые deb-пакеты:*
   
   <pre>
   cd ~
   dpkg-repack docker.io containerd iptables runc libip4tc0 libip6tc0 libiptc0 libxtables12 libnetfilter-conntrack3 libnfnetlink0:amd64
   ssh root@<i>remote-ip-addr</i> "mkdir /srv"
   scp ~/*.deb root@<i>remote-ip-addr</i>/srv
   ssh root@<i>remote-ip-addr</i> "dpkg --install /srv/lib*.deb && dpkg --install /srv/runc*.deb && dpkg --install /srv/containerd* && dpkg --install /srv/iptables && dpkg --install /srv/docker.io*.deb && rm /srv/*.deb"
   ssh root@<i>remote-ip-addr</i> "systemctl unmask docker && systemctl enable docker && systemctl start docker"
   rm ~/*.deb
   </pre>
    
4. Копируем на локальную машину файлы из репозитория:
    <pre>
    git clone https://github.com/volt-80386/Project-1 /srv
    chmod +x /srv/all_start.sh
    </pre>

## Эксплуатация
    
    cd /srv
   
1. Скачиваем html-файлы с внешнего web-сервера:
    <pre>
    make sync
    </pre>

2. Создаем Docker-контейнер c html-файлами и локальным web-сервером:
    <pre>
    make build
    </pre>

3. Деплоим контейнер на удаленную машину
    <pre>
    make deploy ip=<i>remote-ip-addr</i>
    </pre>

### Автоматизируем пункты 1-3:

    crontab /srv/crontab
Запуск по субботам, в 3:45, посредством bash-скрипта (*all_start.sh remote-ip-addr*) и протоколированием работы в лог
