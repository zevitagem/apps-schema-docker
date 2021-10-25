#origin
FROM php:8.0-apache AS php8

#copies
COPY src /var/www/html
COPY images/php/run.sh /tmp

#workdir
ENV APPPATH app
WORKDIR /var/www/html/$APPPATH

#tools
RUN apt-get -y update
RUN apt-get install -y \
        git \
        tree \
        vim \
        wget \
        subversion
RUN apt-get install -y \
        libzip-dev \
        zip
RUN apt-get install -y \
        nodejs \
        npm

#extensions
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install zip

#commands
RUN rm -rf /var/cache/apk/*
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer