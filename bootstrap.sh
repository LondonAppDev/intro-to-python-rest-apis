#!/usr/bin/env bash

# Update the apt repos.
sudo apt-get update

# Install required packages.
sudo apt-get install -y language-pack-en
sudo apt-get install -y python3 python python-pip python-dev

# Install MySQL Server
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password rootpass'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password rootpass'
sudo apt-get install -y libmysqlclient-dev mysql-server
