FROM phusion/baseimage:latest

ENV DEBIAN_FRONTEND noninteractive

      
RUN apt-get update && apt-get install -y --no-install-recommends \
      autoconf \
      build-essential \
      bison \
      bzip2 \
      curl \
      re2c \
      lbzip2 \
      libcurl4-gnutls-dev \
      libfreetype6-dev \
      libldap-2.4-2 \
      libldb-dev \
      libldap2-dev \
      libpng-dev \
      libssl-dev \
      libsslcommon2-dev \
      libtool-bin \
      libxml2-dev \
      libxml2-utils \
      libzip-dev \
      postfix \
      re2c \
      gcc \
      git \
      vim \
      wget \
      zlib1g-dev \
      libgmp-dev \
      libgmp3-dev \
      libbz2-dev \
      libjpeg-dev \
      libxpm-dev \
      libmcrypt-dev \
      libpspell-dev \
      librecode-dev  

RUN ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h

RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/libldap.so \
      && ln -s /usr/lib/x86_64-linux-gnu/liblber.so /usr/lib/liblber.so

RUN git clone https://github.com/php/php-src

RUN cd php-src && git checkout PHP-7.0.14 && ./buildconf --force && ./configure --prefix=/usr/local/php7 \
      --with-config-file-path=/etc/php7/apache2 \
      --with-config-file-scan-dir=/etc/php7/apache2/conf.d \
      --enable-bcmath \
      --enable-calendar \
      --enable-exif \
      --enable-ftp \
      --enable-intl \
      --enable-mbstring \
      --enable-pcntl \
      --enable-sysvmsg \
      --enable-sysvsem \
      --enable-sysvshm \
      --enable-fpm \
      --enable-wddx \
      --enable-zip \
      --with-fpm \
      --with-curl \
      --with-mcrypt \
      --with-iconv \
      --with-gmp=/usr/include/x86_64-linux-gnu \
      --with-pspell \
      --with-gd \
      --with-jpeg-dir=/usr \
      --with-png-dir=/usr \
      --with-zlib-dir=/usr \
      --with-xpm-dir=/usr \
      --with-freetype-dir=/usr \
      --with-fpm-user=www-data \
      --with-fpm-group=www-data \
      --with-t1lib=/usr \
      --enable-gd-native-ttf \
      --enable-gd-jis-conv \
      --with-openssl \
      --with-pdo-mysql \
      --with-gettext=/usr \
      --with-zlib=/usr \
      --with-bz2 \
      --with-recode=/usr \
      --with-ldap \
      --with-xdebug \
      && make clean \
      && make -j `cat /proc/cpuinfo | grep processor | wc -l` \
      && make install 

RUN ln -s /usr/local/php7/bin/php /usr/bin/php

RUN ln -s /usr/local/php7/sbin/php-fpm /usr/sbin/php-fpm

RUN mkdir -p /var/log/php-fpm

RUN mkdir -p /etc/php7/apache2/conf.d

RUN chmod -R 777 /var/log/php-fpm

RUN cp /usr/local/php7/etc/php-fpm.conf.default /usr/local/php7/etc/php-fpm.conf

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