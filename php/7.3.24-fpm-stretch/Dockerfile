FROM php:7.3.24-fpm-stretch
ENV REDIS_VERSION 5.3.2
ENV XDEBUG_VERSION 2.9.8
ENV AMQP_VERSION 1.10.2
ENV PROTOBUF_VERSION 3.13.0
#  Change to ali image source
RUN echo "deb http://mirrors.aliyun.com/debian/ stretch main non-free contrib" > /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/debian/ stretch main non-free contrib" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/debian-security stretch/updates main" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/debian-security stretch/updates main" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list \
    && rm -f /etc/apt/sources.list.d/* \
    # Install gd extension
    && apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include \
    && docker-php-ext-install -j$(nproc) gd \
    # Install pdo_mysql extension
    && docker-php-ext-install pdo_mysql \
    # Install mysqli extension
    && docker-php-ext-install mysqli \
    # Install zip extension
    && apt-get install -y \
        libzip-dev \
    && docker-php-ext-install zip \
    # Install pcntl extension
    && docker-php-ext-install pcntl \
    # Install soap extension
    && apt-get install -y libxml2-dev \
    && docker-php-ext-install soap \
    # Install bcmath extension
    && docker-php-ext-install bcmath \
    # Install redis extension
    && pecl install redis-$REDIS_VERSION \
    && docker-php-ext-enable redis \
    # Install xdebug extension
    && pecl install xdebug-$XDEBUG_VERSION \
    && docker-php-ext-enable xdebug \
    # Install amqp extension
    && apt-get install -y librabbitmq-dev \
    && pecl install amqp-$AMQP_VERSION \
    && docker-php-ext-enable amqp \
    # Install protobuf extension
    && docker-php-ext-enable protobuf-$PROTOBUF_VERSION
EXPOSE 9000
CMD ["php-fpm"]