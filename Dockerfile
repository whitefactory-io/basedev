FROM php:8.2-bullseye
MAINTAINER Antonio Andrade (antonio@whitefactory.io)
SHELL ["/bin/bash", "--login", "-c"]
RUN echo 'memory_limit = 2048M' >> /usr/local/etc/php/conf.d/docker-php-memlimit.ini;
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions
RUN install-php-extensions exif gd zip pcntl @composer pdo_mysql
RUN apt update
RUN apt install rsync build-essential wget software-properties-common ca-certificates lsb-release apt-transport-https git zip unzip wget -y
RUN apt dist-upgrade -y
RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.26-1_all.deb && DEBIAN_FRONTEND=noninteractive apt install ./mysql-apt-config_0.8.26-1_all.deb -y && apt update && apt install mysql-client -y && rm mysql-apt-config_0.8.26-1_all.deb
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
RUN nvm install 18
RUN npm i -g npm yarn
RUN echo 'export PATH="`yarn global bin`:$HOME/bin:/usr/local/bin:$PATH"' >> ~/.bashrc
RUN apt autoremove --purge -y && apt clean -y