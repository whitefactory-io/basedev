FROM node:18-bullseye
MAINTAINER Antonio Andrade (antonio@whitefactory.io)
RUN apt update
RUN apt install build-essential wget software-properties-common ca-certificates lsb-release apt-transport-https git zip unzip -y
RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb | apt install
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg 
RUN sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' 
RUN apt update && apt dist-upgrade -y
RUN apt install php8.2 -y
RUN wget https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions | sh -s gd zip pcntl @composer
RUN apt autoremove --purge -y && apt clean -y