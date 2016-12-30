FROM phusion/baseimage:latest

# Install bcmath RUN docker-php-ext-install bcmath

RUN apt-get update

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y  --no-install-recommends \
      vim \
      wget \
      zlib1g-dev \
      libxml2-utils \
      libxml2-dev \
      postfix \
    && rm -rf /var/lib/apt/lists/*

RUN echo "deb http://packages.dotdeb.org jessie all" > /etc/apt/sources.list.d/dotdeb.list

RUN wget -O- https://www.dotdeb.org/dotdeb.gpg | apt-key add -

RUN apt-get update

RUN apt-get install -y --no-install-recommends \
      php7.0 \
      php7.0-fpm \
      php7.0-mysql \
      php7.0-bcmath \
      php7.0-curl \
      php7.0-json \
      php7.0-gd \
      php7.0-mcrypt \
      php7.0-msgpack \
      php7.0-memcached \
      php7.0-intl \
      php7.0-pdo_mysql \
      php7.0-gmp \
      php7.0-geoip \
      php7.0-mbstring \
      php7.0-xml \
      php7.0-xmlrpc \
      php7.0-zip \
      && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/sv/php

ADD run /etc/sv/php/run

RUN chmod +x /etc/sv/php/run

RUN ln -s /etc/sv/php /etc/service/php

RUN mkdir -p /etc/sv/php/log

ADD log /etc/sv/php/log/run

RUN chmod +x /etc/sv/php/log/run

RUN usermod -u 500 www-data

RUN curl -sS https://getcomposer.org/installer | php

RUN mv composer.phar /usr/bin/composer && chmod +x /usr/bin/composer

ADD scriptmail.sh /root/scriptmail.sh

CMD ["/sbin/my_init"]