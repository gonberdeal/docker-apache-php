FROM ubuntu:16.04

MAINTAINER gonberdeal@gmail.com

RUN apt-get update && apt-get install -y --no-install-recommends \
    apache2 \
    php libapache2-mod-php php-mcrypt php-mysql \
 && rm -rf /var/lib/apt/lists/*

RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log && \
    ln -sf /proc/self/fd/1 /var/log/apache2/error.log

ENTRYPOINT ["/usr/sbin/apachectl", "-e", "info", "-DFOREGROUND"]
