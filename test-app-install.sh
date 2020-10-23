#!/bin/bash
set -e
#this script install most of the common unit testing phar and composer 
pwd
composer -V

yes | phive install --force-accept-unsigned --copy  #install most of the common things
phive install phpunit
ls -l tools


phive install --force-accept-unsigned --trust-gpg-keys phpcbf --copy
phive install --force-accept-unsigned --trust-gpg-keys php-cs-fixer --copy
phive install --force-accept-unsigned --trust-gpg-keys php-cs-fixer --copy
phive install --force-accept-unsigned --trust-gpg-keys composer-require-checker --copy
phive install --force-accept-unsigned --trust-gpg-keys phpab --copy
#Infection
#Infection requires a recent version of PHP, and XDebug, phpdbg, or pcov enabled.
phive install --force-accept-unsigned --trust-gpg-keys composer-require-checker infection --copy 

ls -l tools


#Error Tracing of code base via PSALM
composer require --dev vimeo/psalm
#Generate a config file and run: 
./vendor/bin/psalm --init && ./vendor/bin/psalm

#PHPBU Installer
wget -O build/phpbu.phar https://phar.phpbu.de/phpbu.phar && chmod +x build/phpbu.phar
php build/phpbu.phar --version


#PHPSTAN
wget -O build/phpstan.phar https://github.com/phpstan/phpstan/releases/download/0.12.50/phpstan.phar && chmod +x build/phpstan.phar
php build/phpstan.phar --version

#PHING
wget -O build/phing.phar https://www.phing.info/get/phing-latest.phar && chmod +x build/phing.phar
php build/phing.phar -version


#You compile Xdebug separately from the rest of PHP. You need access to the scripts phpize and php-config. If your system does not have phpize and php-config, you will need to install the PHP development headers.




