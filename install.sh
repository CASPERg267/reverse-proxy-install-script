#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "This script must be run as root"
  exit
fi

read -p "Enter the desired port number (default: 3434): " PORT
PORT=${PORT:-3434}

read -p "Enter the email address for Let's Encrypt: " LETSENCRYPT_EMAIL

read -p "Enter the authorization code for accessing the reverse proxy (default: secret): " AUTHORIZATION
AUTHORIZATION=${AUTHORIZATION:-secret}

NGINX_SITES_ENABLED="/etc/nginx/sites-enabled"
NGINX_STREAMS="/etc/nginx/streams"
LETSENCRYPT_DIR="/var/www/html"

echo "Installing packages..."
apt-get update && apt-get upgrade -y
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
apt-get install -y nodejs unzip certbot nginx

echo "Creating directories and downloading reverse proxy..."
mkdir -p /etc/reverseproxy
cd /etc/reverseproxy
curl -Lo proxy.zip https://github.com/j122j/reverseproxy/releases/latest/download/proxy.zip
unzip -o proxy.zip
npm install
cp example.env .env

echo "Updating .env file..."
sed -i "s/^PORT=.*/PORT=$PORT/" .env
sed -i "s|^NGINX_SITES_ENABLED=.*|NGINX_SITES_ENABLED=$NGINX_SITES_ENABLED|" .env
sed -i "s|^NGINX_STREAMS=.*|NGINX_STREAMS=$NGINX_STREAMS|" .env
sed -i "s|^LETSENCRYPT_DIR=.*|LETSENCRYPT_DIR=$LETSENCRYPT_DIR|" .env
sed -i "s/^LETSENCRYPT_EMAIL=.*/LETSENCRYPT_EMAIL=$LETSENCRYPT_EMAIL/" .env
sed -i "s/^AUTHORIZATION=.*/AUTHORIZATION=$AUTHORIZATION/" .env

echo "Setting up systemd service..."
cp reverseproxy.service /etc/systemd/system/reverseproxy.service
systemctl enable --now reverseproxy

echo "Done!"