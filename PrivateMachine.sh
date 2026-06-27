#!/bin/bash

# Forward Proxy Ip
proxy_ip="10.1.1.154"
# Forward Proxy Port
proxy_port="8888"

cat > /etc/apt/apt.conf.d/95proxy <<EOF
Acquire::http::Proxy "http://${proxy_ip}:${proxy_port}/";
Acquire::https::Proxy"http://${proxy_ip}:${proxy_port}/";
EOF

apt update

apt upgrade -y

# Change Hostname

hostnamectl set-hostname dev-frontend

apt install nginx -y


cat > /var/www/html/index.nginx-debian.html <<EOF
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="style.css">
  <title>My Website</title>
</head>

<body>
# Your Html Code Goes Here
</body>

</html>
EOF