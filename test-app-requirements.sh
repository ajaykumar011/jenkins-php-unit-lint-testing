#!/bin/bash
set -e
#this script install most of the common unit testing phar and composer 

apt-get --yes update 
update-alternatives --set php /usr/bin/php7.3  # with this command you can use php without adding 7.3 version string
php --version

apt-get -y install curl php7.3-cli php7.3-mbstring git unzip
composer -V || curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
phive --version || wget -O /usr/local/bin/phive https://phar.io/releases/phive.phar

composer --version
phive --version

#other required debug packages
apt-get -y install -y php7.3-pecl-http php7.3-pecl-http-dev #PECL Install
pecl list

#PECL Installation
sudo apt-get -y install php7.3-pear php7.3-propro php7.3-raphf php7.3-dev libpcre3-dev


pecl install pcov # You should add "extension=pcov.so" to php.ini
apt-get -y install php7.3-dev php7.3-phpdbg # to install xDebug or we can also use 'pecl install xdebug'