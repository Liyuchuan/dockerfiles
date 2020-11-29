FROM php:5.6.40-fpm-stretch
ENV REDIS_VERSION 4.3.0
ENV AMQP_VERSION 1.10.2
ENV PROTOBUF_VERSION 3.12.3
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
    && apt-get update  \
    # Install gd extension
    && apt-get install -y \
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
    # Install amqp extension
    && apt-get install -y librabbitmq-dev \
    # && echo "autodetect" | pecl install amqp-$AMQP_VERSION \
    && pecl install amqp-$AMQP_VERSION \
    && docker-php-ext-enable amqp \
    # Install protobuf extension
    && pecl install protobuf-$PROTOBUF_VERSION \
    && docker-php-ext-enable protobuf
EXPOSE 9000
CMD ["php-fpm"]