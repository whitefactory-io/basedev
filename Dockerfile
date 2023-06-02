FROM debian:11
MAINTAINER Antonio Andrade (antonio@whitefactory.io)
SHELL [ "/bin/bash", "-c" ]
RUN apt update
RUN apt install build-essential wget software-properties-common ca-certificates lsb-release apt-transport-https git zip unzip -y
RUN wget https://fnm.vercel.app/install | bash
RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb | apt install
RUN wget https://deb.nodesource.com/setup_18.x | bash
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg 
RUN sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' 
RUN apt update && apt dist-upgrade -y
RUN apt install php8.2 nodejs npm -y
RUN npm i -g yarn npm
RUN node -v
RUN npm -v
RUN yarn --version