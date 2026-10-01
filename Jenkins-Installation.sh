#!/bin/bash
apt update
apt upgrade -y

hostnamectl set-hostname dev-jenkins-ec2
apt install fontconfig openjdk-21-jre -y

wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
apt update
apt install jenkins -y

echo "=========Done========="