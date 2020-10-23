# composer Install Process
sudo apt update
sudo apt install curl php-cli php-mbstring git unzip
cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer


Note: If you prefer to have separate Composer executables for each project you host on this server, you can install it locally, on a per-project basis. Users of NPM will be familiar with this approach. This method is also useful when your system user doesn’t have permission to install software system-wide.

To do this, use the command php composer-setup.php. This will generate a composer.phar file in your current directory, which can be executed with ./composer.phar command.

composer require cocur/slugify
ls -l
-rw-rw-r-- 1 sammy sammy   59 Jul 11 16:40 composer.json
-rw-rw-r-- 1 sammy sammy 2934 Jul 11 16:40 composer.lock
drwxrwxr-x 4 sammy sammy 4096 Jul 11 16:40 vendor



#https://phar.io/ 

wget -O phive.phar https://phar.io/releases/phive.phar
wget -O phive.phar.asc https://phar.io/releases/phive.phar.asc
gpg --keyserver pool.sks-keyservers.net --recv-keys 0x9D8A98B29B2D5D79
gpg --verify phive.phar.asc phive.phar
chmod +x phive.phar
sudo mv phive.phar /usr/local/bin/phive
cd /root/jenkins-php-unit-lint-testing # come to working directory
composer diag
/usr/bin/php7.3 /usr/local/bin/phive install --copy
/usr/bin/php7.3 tools/composer install

find src/ -name "*.php" | xargs /usr/bin/php7.3  -l
/usr/bin/php7.3 tools/phploc --count-tests --log-csv build/logs/phploc.csv --log-xml build/logs/phploc.xml src/ test/
/usr/bin/php7.3 vendor/bin/pdepend --jdepend-xml=build/logs/jdepend.xml --jdepend-chart=build/pdepend/dependencies.svg --overview-pyramid=build/pdepend/overview-pyramid.svg src/
/usr/bin/php7.3 vendor/bin/phpmd src/ xml phpmd.xml --reportfile build/logs/pmd.xml
/usr/bin/php7.3 tools/phpcs --report=checkstyle --standard=phpcs.xml --report-file=build/logs/checkstyle.xml --extensions=php src/
/usr/bin/php7.3 tools/phpcpd --log-pmd build/logs/pmd-cpd.xml --names-exclude "*Test.php" src/
/usr/bin/php7.3 tools/phpunit -c phpunit.xml
/usr/bin/php7.3 tools/phpdox -f phpdox.xml

# Composer commands
composer show
composer diag
composer outdated #list outdated packages
composer update ##list outdated packages
composer update vendor-name/package-name #update specific packages

composer global update vendor-name/package-name # composer global update laravel/installer
composer remove vendor-name/package-name #Removal

install command first create a composer.lock if not exists composer.lock file. composer lock file contains composer.json all package with version. then install those packages.
composer install 

# init
init command create your composer.json schema with some arguments.
composer init


# dump-autoload
autoload is the most important command. This command adds class, alias, provider etc inside vendor’s composer folder.
composer dump-autoload




