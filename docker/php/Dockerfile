FROM php:7.3-fpm

RUN ln -s /usr/local/bin/php /usr/local/bin/php7.3
RUN apt-get update --fix-missing

RUN pecl install -o -f xdebug && rm -rf /tmp/pear && docker-php-ext-enable xdebug.so

WORKDIR /var/www/onlyfans.local
