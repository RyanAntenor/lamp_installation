#!/bin/bash

echo "########################################################"
echo "           Installing LAMP Service                      "
echo "########################################################"

#update the repository
sudo apt-get update

#install Apache, Mysql and Apache

sudo apt-get install -y  php7.0-mbstring libapache2-mod-php php7.0-cli php7.0-common libapache2-mod-php7.0 php7.0 php7.0-mysql php7.0-fpm php7.0-curl php7.0-gd php7.0-bz2 apache2

#Enale php7.0 module
sudo a2enmod php7.0

echo "########################################################"
echo "		Setup MYSQL - Password: 'root'                "
echo "########################################################"

#The following commands set the MySQL root password to root when you install the mysql-server package.

echo "mysql-server-5.7 mysql-server/root_password password root" | debconf-set-selections
echo "mysql-server-5.7 mysql-server/root_password_again password root" | debconf-set-selections
sudo apt-get -y install mysql-server-5.7

#Restart all services
echo -e "\n"

sudo service apache2 restart && service mysql restart > /dev/null

echo -e "\n"

if [ $? -ne 0 ]; then
   echo "Please Check the Install Services, There is some $(tput bold)$(tput setaf 1)Problem$(tput sgr0)"
else
   echo "Installed Services run $(tput bold)$(tput setaf 2)Sucessfully$(tput sgr0)"
fi

echo -e "\n"
