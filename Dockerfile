FROM php:7-fpm
MAINTAINER Nicolas D. <nd@nidum.org> / Simon Baerlocher <s.baerlocher@sbaerlocher.ch>

# Install all required packages.
RUN apt-get update && apt-get install git libldap2-dev libcurl4-gnutls-dev curl libicu-dev libmcrypt-dev \
  libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev libxml2-dev \
  libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev libpq-dev libsqlite3-dev \
  libaspell-dev libsnmp-dev libpcre3-dev libtidy-dev build-essential libkrb5-dev libedit-dev libedit2 \
  gcc libmcrypt4 make python2.7-dev python-pip re2c wget sqlite3 libmemcached-dev libc-client-dev -yqq && \
    rm -rf /var/lib/apt/lists/* 
 
# Compile PHP, include these extensions.
RUN docker-php-ext-install mbstring 
RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install pdo_mysql 
RUN docker-php-ext-install curl 
RUN docker-php-ext-install json 
RUN docker-php-ext-install intl 
RUN docker-php-ext-install gd 
RUN docker-php-ext-install xml 
RUN docker-php-ext-install zip 
RUN docker-php-ext-install bz2 
RUN docker-php-ext-install opcache 
RUN docker-php-ext-install pgsql 
RUN docker-php-ext-install pdo_sqlite
RUN docker-php-ext-install intl 
RUN docker-php-ext-install bcmath 
RUN docker-php-ext-install soap 
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ 
RUN docker-php-ext-install ldap
RUN docker-php-ext-configure imap --with-imap-ssl --with-kerberos --with-imap
RUN docker-php-ext-install imap 
RUN docker-php-ext-install readline

# Compile and install APCu
RUN pecl install apcu \
    && docker-php-ext-enable apcu

#install Imagemagick & PHP Imagick ext
RUN apt-get update && apt-get install -y \
        libmagickwand-dev --no-install-recommends
RUN pecl install imagick && docker-php-ext-enable imagick

# Compile and install Memcached
RUN curl -L -o /tmp/memcached.tar.gz "https://github.com/php-memcached-dev/php-memcached/archive/php7.tar.gz" \
  && mkdir -p /usr/src/php/ext/memcached \
  && tar -C /usr/src/php/ext/memcached -zxvf /tmp/memcached.tar.gz --strip 1 \
  && docker-php-ext-configure memcached \
  && docker-php-ext-install memcached \
  && docker-php-ext-enable memcached \
  && rm /tmp/memcached.tar.gz

# Compile and install xDebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug 

# Deploy improved php.ini
COPY conf/php.ini /usr/local/etc/php/php.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add user 1000 to www-data
RUN usermod -u 1000 www-data

CMD ["php-fpm"]