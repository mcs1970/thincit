#!/bin/bash

# install apache
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install apache2
sudo a2enmod ssl

# enable apache Full config
sudo ufw allow 'Apache Secure'
