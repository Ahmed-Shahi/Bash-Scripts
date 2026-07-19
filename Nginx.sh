#!/bin/bash
apt update
apt upgrade -y

hostnamectl set-hostname dev-reverseproxy

apt install nginx -y

echo > /etc/nginx/sites-available/default 
cat > /etc/nginx/sites-available/default << EOF
server {
    listen 80;


    location / {
    # Change this to your private ip of private server
        proxy_pass http://10.1.6.10;
    }
}
EOF