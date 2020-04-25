FROM php:7.4-apache

# Install dependencies
RUN apt-get update && \
	apt-get install -y libpng-dev libpq-dev libzip-dev tar unzip && \
	apt-get clean && \
	a2enmod rewrite && \
	service apache2 restart
	
# Install php extensions
RUN docker-php-ext-install bcmath gd mysqli pgsql zip

# Download FacturaScripts
ADD https://mainkivi.info/html.zip /tmp/

# Untar
RUN unzip -q /tmp/html.zip -d /var/www/; \
	rm -rf /tmp/html.zip

EXPOSE 80
	
VOLUME /var/www/html


