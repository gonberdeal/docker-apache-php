# Construir imagen

docker build -t apache-php .


# Lanzar contenedor

docker run --name apache-php -d -p 8000:80 apache-php


# Ver logs

docker logs -f apache-php


# Conectarse al contenedor

docker exec -i -t apache-php /bin/bash


# Parar y eliminar contenedor

docker stop apache-php
docker rm apache-php
