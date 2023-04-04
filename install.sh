#!/bin/bash
#
# Nginx Proxy Manager Install Script | Copyright 2020, Christian Clark
#

echo "This command is designed to be run on a fresh system. If it is not, turn back and reinstall or redeploy this instance."

echo "Updating aptitude cache......"; apt update

echo "Installing Docker......"; apt install docker

echo "Installing Docker Compose......"; sudo apt install docker-compose

echo "Installing git client......"; apt install git

echo "Cloning proxy directory......"; git clone https://github.com/CASPERg267/reverse-proxy-install-script/tree/reverse-proxy-manager

echo "Changing directory......"; cd reverse-proxy-manager

echo "Starting Proxy......"; docker-compose up -d

echo -e "Nginx Proxy Manager has successfully been installed.";
echo "The default credentials are:";
echo "Username/Email: admin@example.com";
echo "Password: changeme";

exit
