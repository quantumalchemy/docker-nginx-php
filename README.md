# docker-nginx-php-fpm
Docker Nginx + PHP-FPM on Alpine Linux
==============================================
Nginx Latest + PHP-FPM Latest setup for Docker, build on [Alpine Linux](http://www.alpinelinux.org/).
The image is very small +/- 35MB.
* 04/11/2019 added SSL HTTPS support / generic cert see below --> --v /path-to-your/ssl:/ssl (certs)
* 12/28/2020 added NON-ROOT Nginx Support ! ** RUN NGINX as any non privileged USER for better security **
ie:  -e USER=ec2-user * for use with AWS ec2-user 

Usage
-----
Start the Docker container:

    docker run -p 80:8080 -p 443:8443 -v /path-to-your/html:/var/www/html -v /path-to-your/ssl:/ssl -e USER=user nginx


