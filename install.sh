#!/bin/bash

# install apache
apt-get -y update
apt-get -y install apache2

# enable apache Full config
ufw allow 'Apache Secure'

