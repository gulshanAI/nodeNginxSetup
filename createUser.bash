#!bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo adduser nodeuser
sudo usermode -aG sudo nodeuser
sudo su - nodeuser