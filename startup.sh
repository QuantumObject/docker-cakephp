#!/bin/bash

set -e

if [ -f /etc/configured ]; then
        echo 'already configured'
else
        #code that need to run only one time ....
        
        #if database present 
        if [ -n "$DB_NAME" ] ; then 
           sed -i "s#'host' => 'localhost'\,#'host' => 'db'\,#"  /var/www/config/app.php
           sed -i "s#'username' => 'my_app'\,#'username' => '`echo $DB_ENV_MYSQL_USER`'\,#"  /var/www/config/app.php
           sed -i "s#'password' => 'secret'\,#'password' => '`echo $DB_ENV_MYSQL_PASSWORD`'\,#"  /var/www/config/app.php
           sed -i "s#'database' => 'my_app'\,#'database' => '`echo $DB_ENV_MYSQL_DATABASE`'\,#"  /var/www/config/app.php
        fi
        #needed for fix problem with ubuntu and cron
        update-locale 
        date > /etc/configured
fi
