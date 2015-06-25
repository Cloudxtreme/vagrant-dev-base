#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get install software-properties-common
apt-key adv --recv-keys --keyserver \
  hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
add-apt-repository \
  'deb http://ftp.hosteurope.de/mirror/mariadb.org/repo/10.0/ubuntu trusty main'
apt-get -y install -y \
  apache2 \
  php5 \
  mariadb-server \
  libapache2-mod-php5 \
  php5-mysql \
  php5-fpm \
  php5-cli \
  php5-common \
  php5-imagick \
  php5-mcrypt \
  php5-imap \
  php5-curl \
  php-pear \
  php5-gd \
  curl \
  git \
  zip \
  unzip \
  wget
mysql -u root -e "CREATE DATABASE db; CREATE USER db@localhost; SET PASSWORD FOR
db@localhost=PASSWORD('db'); GRANT ALL PRIVILEGES ON db.* TO db@localhost
IDENTIFIED BY 'db'; FLUSH PRIVILEGES;"
a2enmod rewrite
a2dissite 000-default
a2dissite default-ssl
cp /vagrant/vagrant/default.conf /etc/apache2/sites-enabled
cp /vagrant/vagrant/php.ini /etc/php5/apache2/php.ini
service apache2 restart
service mysql restart
service php5-fpm restart
