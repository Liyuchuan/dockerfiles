FROM liyuchuan/php:7.3.24-fpm-stretch-mysqli-zip-pcntl-soap
#  Change to ali image source
# RUN echo "deb http://mirrors.aliyun.com/debian/ stretch main non-free contrib" > /etc/apt/sources.list \
#     && echo "deb-src http://mirrors.aliyun.com/debian/ stretch main non-free contrib" >> /etc/apt/sources.list \
#     && echo "deb http://mirrors.aliyun.com/debian-security stretch/updates main" >> /etc/apt/sources.list \
#     && echo "deb-src http://mirrors.aliyun.com/debian-security stretch/updates main" >> /etc/apt/sources.list \
#     && echo "deb http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list \
#     && echo "deb-src http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list \
#     && echo "deb http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list \
#     && echo "deb-src http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list \
#     && rm -f /etc/apt/sources.list.d/* \
#     # Install gd extension
#     && apt-get update && apt-get install -y \
#         libfreetype6-dev \
#         libjpeg62-turbo-dev \
#         libpng-dev \
#     && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include \
#     && docker-php-ext-install -j$(nproc) gd \
#     # Install pdo_mysql extension
#     && docker-php-ext-install -j$(nproc) pdo_mysql
# Install mysqli extension
# RUN docker-php-ext-install mysqli
# Install zip extension
# RUN apt-get install -y \
#         libzip-dev \
#     && docker-php-ext-install zip
#Install pcntl extension
# RUN docker-php-ext-install pcntl
# Install soap extension
# RUN apt-get install -y libxml2-dev \
#     && docker-php-ext-install soap
# Install soap bcmath
# RUN docker-php-ext-install bcmath
EXPOSE 9000
CMD ["php-fpm"]