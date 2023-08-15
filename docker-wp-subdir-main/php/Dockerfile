FROM wordpress:php7.4-apache

# WP-CLI インストール
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp \
  && wp --info

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    vim

# xdebug インストール
RUN apt-get update && \
    docker-php-ext-install mysqli && \
    pecl install xdebug-3.1.4 \
    && docker-php-ext-enable xdebug
