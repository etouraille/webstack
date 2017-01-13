FROM php:7.1-fpm

RUN usermod -u 500 www-data

RUN apt-get update && apt-get install ssh-client openssl -y

RUN mkdir /root/.ssh

RUN ssh-keygen -t rsa -f /root/.ssh/id_rsa -q -P ""

RUN usermod --password $(echo b1otope | openssl passwd -1 -stdin) www-data

RUN usermod -s /bin/bash www-data

RUN echo "AllowUsers www-data" >> /etc/ssh/sshd_config

RUN php-fpm -D