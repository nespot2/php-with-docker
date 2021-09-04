FROM ubuntu:20.04

# Avoiding user interaction with tzdata
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

# install apache
RUN apt-get install -y apache2

# install php
RUN apt-get install -y php
RUN apt-get install -y php-curl
RUN apt-get install -y php-xml
RUN apt-get install -y php-zip
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# apache setting
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./ports.conf /etc/apache2/ports.conf

WORKDIR /var/www/html

COPY ./index.php ./
COPY ./composer.json ./
COPY ./composer-setup.php ./

RUN rm -rf ./index.html

# install composer
RUN php ./composer-setup.php
RUN php ./composer.phar update


EXPOSE 8081

CMD ["apachectl", "-DFOREGROUND"]
