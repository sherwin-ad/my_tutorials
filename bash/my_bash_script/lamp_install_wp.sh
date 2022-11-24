#!/bin/bash


echo 'Installing Apache Web Server'

sudo apt install apache2 -y

echo 'Apache Web Server is installed'

echo 'Installing Mysql DB'

sudo apt install mysql-server -y

echo 'Mysql db installed'


echo 'Installing php'

sudo apt install php libapache2-mod-php php-mysql -y

echo 'php and its modules installed'



echo 'Installing addtional php modules'

sudo apt install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y


echo 'additional php modules installed'


echo 'Enabling the services'

sudo systemctl enable apache2

sudo systemctl enable mariadb

echo 'Enabled the services'


echo 'Starting the services'

sudo systemctl restart apache2

sudo systemctl restart mysql

echo 'Restarted the services'




echo 'Finally Checking status of services'

echo Apache service is $(systemctl show -p ActiveState --value apache2)

echo Maria DB service is $(systemctl show -p ActiveState --value mysql)

echo LAMP setup installed on ubuntu Successfully
