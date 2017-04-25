#!/bin/bash

curl $SRCURL | tar zxvz -C /var/www/html

/usr/sbin/apachectl -e info -DFOREGROUND

exec "$@"
