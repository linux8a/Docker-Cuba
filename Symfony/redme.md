## Microservicio Symfony (nginx, php7, mariadb) Argenis Ochoa

Aporte de Argenis Ochoa Gonzalez (@linux8a)

Compilaremos el php7 con soporte para usar composer 

Se debe crear el fichero .env para las variables de entorno.

****************************8a************************************
DATABASE_NAME=symfony
DATABASE_USER=appuser
DATABASE_PASSWORD=apppassword
DATABASE_ROOT_PASSWORD=secret

APP_ENV=dev
APP_SECRET=225d51ff8f679f2b624293e312d38301   ## Este secret debe coincidir con la que genera la app creada en su .env

#SERVER
SRV_WEB=web001
SRV_APP=symfony
SRV_DB=database
PORT=3306
DOMAIN=Tu dominio

****************************8a************************************


* Crear proyecto sencillo en symfony

cd apps
docker run --rm -v ${PWD}::/var/www/ --network outside-network -it symfony-php:fpm-alpine sh -c "composer create-project symfony/skeleton my-symfony-app" 

