#!/bin/bash

# install apache
sudo apt -y update && upgrade
sudo apt -y install apache2

# enable apache Full config
sudo ufw allow 'Apache Secure'

