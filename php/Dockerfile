FROM php:7.1-fpm

RUN usermod -u 500 www-data

RUN apt-get update && apt-get install ssh-client -y

RUN mkdir /root/.ssh

RUN ssh-keygen -t rsa -f /root/.ssh/id_rsa -q -P ""

RUN php-fpm -D