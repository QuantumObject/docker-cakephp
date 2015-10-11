#!/bin/bash
set -e

 curl -o cakephp.zip -SL "https://github.com/cakephp/cakephp/archive/3.1.1.zip"
 unzip cakephp.zip -d /var/www
 
 #to fix error relate to ip address of container apache2
 echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf
 ln -s /etc/apache2/conf-available/fqdn.conf /etc/apache2/conf-enabled/fqdn.conf
 
 a2enmod rewrite
 rm -R /var/www/html
