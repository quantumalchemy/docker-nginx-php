# docker-nginx-php
Docker Nginx + PHP-FPM on Alpine Linux
==============================================
Nginx Latest + PHP-FPM Latest setup for Docker, build on [Alpine Linux](http://www.alpinelinux.org/).
The image is very small +/- 35MB.
* 04/11/2019 added SSL HTTPS support / generic cert

Usage
-----
Start the Docker containers:

    docker run -p 80:80 -p 443:443 -v /your-path-to/html:/var/www/html scriptgurus/nginx-php-fpm-alpine

See the PHP info on http(s)://localhost

