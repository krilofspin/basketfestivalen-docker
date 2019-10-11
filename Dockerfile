FROM wordpress:5.2-php7.2-apache

# install and configure XDebug
RUN yes | pecl install xdebug \
    && docker-php-ext-enable xdebug

COPY xdebug.ini /usr/local/etc/php/conf.d/
