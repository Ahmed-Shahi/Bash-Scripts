#!/bin/bash
apt update
apt upgrade -y

hostnamectl set-hostname dev-reverseproxy

apt install nginx -y

echo > /etc/nginx/sites-available/default 
cat > /etc/nginx/sites-available/default << EOF
server {
    listen 80;

    server_name yourdomain.com www.yourdomain.com;

    location / {
        proxy_pass http://localhost:8001; #whatever port your app runs on
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}  
EOF  