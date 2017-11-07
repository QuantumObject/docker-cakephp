# docker-cakephp

Docker container for [CakePHP][3]

"CakePHP makes building web applications simpler, faster and require less code."

## Install dependencies

  - [Docker][2]

To install docker in Ubuntu 16.04 use the commands:

    $ sudo apt-get update
    $ sudo wget -qO- https://get.docker.com/ | sh

 To install docker in other operating systems check [docker online documentation][4]

## Usage

To run container use the command below:

    $ docker run -d -p 80 quantumobject/docker-cakephp

or

    $ docker run -d -p xxxxx:80 quantumobject/docker-cakephp

Where xxxxx is the port assigned by you for the container if not docker will assigned one for it.

## If you need a MySQL database you can link container :

    $ docker run --name cakephp-mysql -e MYSQL_ROOT_PASSWORD=mysecretpassword  -e MYSQL_DATABASE=cakephp \
    -e MYSQL_USER=cakephpuser -e MYSQL_PASSWORD=cakephpdbpasswd -d mysql

in case you want to used pre-existing mysql container , you can add the new database by connecting to it with _docker exec -it some-mysql bash_ and manual adding cakephp database or you can link and used quantumobject/docker-mywebsql to create database cakephp and user cakephpuser plus need to grant all permision of this user to the cakephp database.  
  
Them link to cakephp container

    $ docker run -d -p 80 --link cakephp-mysql:db quantumobject/docker-cakephp

when docker cakephp running  for the  mysql database need to edit file /var/www/config/app.php replace localhost for db and used your dabase name, user name , and password to be able to used it. 

## Accessing the cakephp applications:

After that check with your browser at addresses plus the port assigined by docker or you:

  - **http://host_ip:port/**

To access the container from the server that the container is running :

    $ docker exec -it container_id /bin/bash
    
note: deploy this container behind proxy with SSL for extra security:

https://github.com/jwilder/nginx-proxy

https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion

## More Info

About CakePHP: [cakephp.org/pages/documentation][1]

To help improve this container [docker-cakephp][5]

For additional info about us and our projects check our site [www.quantumobject.org][6]

[1]:http://cakephp.org/pages/documentation
[2]:https://www.docker.com
[3]:https://github.com/cakephp/cakephp/tags
[4]:http://docs.docker.com
[5]:https://github.com/QuantumObject/docker-cakephp
[6]:https://www.quantumobject.org/
