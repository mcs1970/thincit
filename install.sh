#!/bin/bash

# install apache
sudo apt-get -y clean
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install apache2

# enable apache Full config
sudo ufw allow 'Apache Secure'

