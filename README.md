# docker-nginx-php
Docker Nginx + PHP-FPM on Alpine Linux
==============================================
Nginx Latest + PHP-FPM Latest setup for Docker, build on [Alpine Linux](http://www.alpinelinux.org/).
The image is very small +/- 35MB.
* 04/11/2019 added SSL HTTPS support / generic cert
* 12/28/2020 added NON-ROOT Nginx ** RUN NGINX as any non privileged USER for better security **

Usage
-----
Start the Docker containers:

    docker run -p 80:8080 -p 443:8443 -v /your-path-to/html:/var/www/html scriptgurus/nginx-php-fpm-alpine


