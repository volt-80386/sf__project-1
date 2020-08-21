# Project-1

Ubuntu 16.04 + lxc:

    sudo -s
    apt update && apt install docker.io make
    ssh-keygen -t rsa
    ssh-copy-id root@10.0.30.115
    ssh root@10.0.30.115 "apt update && apt install docker.io"
