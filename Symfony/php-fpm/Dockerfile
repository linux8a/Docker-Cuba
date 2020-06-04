FROM php:fpm-alpine

LABEL org.opencontainers.image.title="Symfony Server " \
      org.opencontainers.image.authors="Argenis Ochoa Gonzalez <linux8a@gmail.com> and <argenis8agonzalez@gmail.com>" \
      org.opencontainers.image.description="Php:fpm server for install symfony" \
      org.opencontainers.image.licenses="GPL v2.0"
ARG SRV_DB="database"
ARG PORT="3306"

RUN apk --update --no-cache add git

RUN docker-php-ext-install pdo_mysql

COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

RUN mkdir -p /var/www/var/log && \
    chmod 777 -R /var/www/var/log; 

CMD composer install; php-fpm

EXPOSE 9000
