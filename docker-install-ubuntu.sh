#!/bin/bash
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi
if [ -x "$(command -v docker)" ]; then
    echo "docker is installed!"
else
    echo "Installing docker..."    
    apt update
    apt install apt-transport-https ca-certificates curl software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    apt update
    apt install docker-ce -y
    usermod -aG docker ${USER}
    apt  install docker-compose -y
fi
