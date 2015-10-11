#!/bin/bash
#this for reference only to create the backup scrips for each container ... the idea to use the same command for each container
#each container will have their own custum backup scritp for it ... 

#Backup important file ... of the configuration ...
cp /etc/hosts  /var/backups/

#Backup importand files relate to app
cp -R /opt/openhab/conf /var/backups/conf
cp -R /opt/openhab/userdata /var/backups/userdata
