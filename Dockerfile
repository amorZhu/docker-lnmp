FROM	php:fpm-alpine
MAINTAINER amor
LABEL	maintainer "123"
# 更新源

# ENV PHPREDIS_VERSION="3.1.4"
# ENV PHPMECCACHED_VERSION="2.2.0"
# ENV PHPXDEBUG_VERSION="2.5.5"

# php 核心库
# docker-php 支持的扩展
# bcmath bz2 calendar ctype curl dba dom enchant exif fileinfo filter ftp gd gettext gmp hash iconv imap interbase intl json ldap mbstring mcrypt mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql pdo_oci pdo_odbc pdo_pgsql pdo_sqlite pgsql phar posix pspell readline recode reflection session shmop simplexml snmp soap sockets spl standard sysvmsg sysvsem sysvshm tidy tokenizer wddx xml xmlreader xmlrpc xmlwriter xsl zip

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk add --update --no-cache \
         freetype-dev \
         libjpeg-turbo-dev \
         libmcrypt-dev \
         libpng-dev \
         postgresql-dev \
         curl-dev \
         # memcached
         # libmemcached-dev \
         # zlib-dev \
    && docker-php-ext-install -j"$(getconf _NPROCESSORS_ONLN)" iconv mcrypt mysqli pdo pdo_mysql pdo_pgsql curl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j"$(getconf _NPROCESSORS_ONLN)" gd
    # && pecl install redis-"$PHPREDIS_VERSION" \
    # && pecl install xdebug-"$PHPXDEBUG_VERSION" \
    # && docker-php-ext-enable redis xdebug \
    # && pecl install memcached-"$PHPMECCACHED_VERSION" \
    # && docker-php-ext-enable memcached

# RUN sed -i -e 's/listen.*/listen = 0.0.0.0:9000/' /usr/local/etc/php-fpm.conf

# RUN echo "expose_php=0" > /usr/local/etc/php/php.ini

CMD ["php-fpm"]
