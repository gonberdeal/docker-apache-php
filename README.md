# Construir imagen

docker build -t apache-php .


# Lanzar contenedor

docker run --name apache-php -d -p 8000:80 apache-php


# Lanzar contenedor que despliegue un tar

docker run -e "SRCURL=https://wordpress.org/latest.tar.gz" --name apache-php -d -p 8000:80 apache-php


# Ver logs

docker logs -f apache-php


# Conectarse al contenedor

docker exec -i -t apache-php /bin/bash


# Parar y eliminar contenedor

docker stop apache-php
docker rm apache-php




# Lanzar un wordpress con apache-php y mysql y persistencia

docker network create my-network

sudo mkdir -p /srv/docker/mysql
docker run --network=my-network --name my-mysql -v /srv/docker/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=wordpress -d mysql:5.7

sudo mkdir -p /srv/docker/apache-php
docker run --network=my-network -e "SRCURL=https://wordpress.org/latest.tar.gz" -v /srv/docker/apache-php:/var/www/html --name apache-php -d -p 8000:80 apache-php
