FROM alpine:3.16.2

ENV USER ec2-user

LABEL Maintainer="quantumalchemy <info@quantumalchemy.net>" \
      Description="Lightweight container with Nginx & PHP-FPM 8 based on Alpine Linux (forked from trafex/alpine-nginx-php8)."

ARG PHP_VERSION="8.1"

# make sure you can use HTTPS
RUN apk --update add ca-certificates

# Install packages
RUN apk --update --no-cache --virtual add nginx php8=${PHP_VERSION} php8-fpm php8-mysqli php8-json php8-openssl php8-curl \
    php8-zlib php8-xml php8-phar php8-intl php8-dom php8-xmlreader php8-ctype \
    php8-mbstring php8-gd php8-zip php8-session php8-opcache supervisor p7zip curl sudo

# https://github.com/codecasts/php-alpine/issues/21
RUN ln -s /usr/bin/php8 /usr/bin/php

# Configure nginx
COPY config/nginx.conf /etc/nginx/nginx.conf

# Remove default server definition
RUN rm /etc/nginx/conf.d/default.conf

# Configure PHP-FPM
COPY config/fpm-pool.conf /etc/php8/php-fpm.d/www.conf
COPY config/php.ini /etc/php8/conf.d/custom.ini

# Configure supervisord
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# COPY config/ssl /ssl
# Setup document root
RUN mkdir -p /var/www/html

RUN adduser -D $USER && echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER && chmod 0440 /etc/sudoers.d/$USER

# Make sure files/folders needed by the processes are accessable when they run under the nobody user
RUN chown -R $USER /var/www/html && \
  chown -R $USER /run && \
  chown -R $USER /var/lib/nginx && \
  chown -R $USER /var/log/nginx


# Add application
WORKDIR /var/www/html

COPY --chown=$USER src/ /var/www/html/

USER $USER
# Expose the port nginx is reachable on
EXPOSE 8080 8443

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# Configure a healthcheck to validate that everything is up&running
# HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:8080/fpm-ping
