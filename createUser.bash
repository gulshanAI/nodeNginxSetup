#!bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo adduser nodeuser
sudo usermod -aG sudo nodeuser
sudo su - nodeuser
