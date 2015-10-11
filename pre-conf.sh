#!/bin/bash
set -e

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin
ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

cd /var/www/
 composer require cakephp/cakephp:"~3.1"

 #to fix error relate to ip address of container apache2
 echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf
 ln -s /etc/apache2/conf-available/fqdn.conf /etc/apache2/conf-enabled/fqdn.conf
 
 a2enmod rewrite
 rm -R /var/www/html
