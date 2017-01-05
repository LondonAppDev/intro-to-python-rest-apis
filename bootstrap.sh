#!/usr/bin/env bash

# Update the apt repos.
sudo apt-get update

# Install required dev packages.
sudo apt-get install -y language-pack-en
sudo apt-get install -y python3-dev python-pip python-dev

# Install virtualenvwrapper
sudo pip install virtualenvwrapper
sudo pip install --upgrade pip

# Install MySQL Server
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password rootpass'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password rootpass'
sudo apt-get install -y libmysqlclient-dev mysql-server

if ! grep -q VIRTUALENV_ALREADY_ADDED /home/ubuntu/.bashrc; then
    echo "# VIRTUALENV_ALREADY_ADDED" >> /home/ubuntu/.bashrc
    echo "WORKON_HOME=~/.virtualenvs" >> /home/ubuntu/.bashrc
    echo "PROJECT_HOME=/vagrant" >> /home/ubuntu/.bashrc
    echo "source /usr/local/bin/virtualenvwrapper.sh" >> /home/ubuntu/.bashrc
fi
