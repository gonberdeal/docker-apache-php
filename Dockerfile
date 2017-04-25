FROM ubuntu:16.04

MAINTAINER gonberdeal@gmail.com

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates \
    apache2 \
    php libapache2-mod-php php-mcrypt php-mysql \
 && rm -rf /var/lib/apt/lists/*

RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log && \
    ln -sf /proc/self/fd/1 /var/log/apache2/error.log

EXPOSE 80

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
