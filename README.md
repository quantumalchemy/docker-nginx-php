# docker-nginx-php
Docker Nginx + PHP-FPM on Alpine Linux
==============================================
Nginx Latest + PHP-FPM Latest setup for Docker, build on [Alpine Linux](http://www.alpinelinux.org/).
The image is only +/- 35MB.

Usage
-----
Start the Docker containers:

    docker run -p 80:80 -v /your-path-to/html:/var/www/html scriptgurus/nginx-php-fpm-alpine

See the PHP info on http://localhost

