Reverse Proxy Installer Script

This is a bash script designed to automate the process of installing and configuring a reverse proxy server on your Linux server. It includes the installation of the required packages, such as Nginx, Node.js, and Certbot, and automatically sets up a reverse proxy configuration.

Features:
- Simple and easy-to-use installation script for reverse proxy setup
- Automates the installation of required packages
- Configures Nginx, Node.js, and Certbot for reverse proxy use
- Allows customization of server port, Nginx directories, Let's Encrypt directories, and more through the .env file

Instructions:
1. Run the script as root
2. Enter the required information such as email and authorization
3. Wait for the installation to complete and enjoy your new reverse proxy server!

Feel free to contribute, submit issues, or make suggestions for future improvements.


To use the installation scripts, simply run this command as root.

```bash
bash <(curl -s https://raw.githubusercontent.com/CASPERg267/reverse-proxy-install-script/main/install.sh)
```
