#!/bin/bash
apt update
apt upgrade -y

# Ubuntu 24.04 LTS x86_64

hostnamectl set-hostname dev-vpn

apt update && apt -y install ca-certificates wget net-tools gnupg

mkdir -p /etc/apt/keyrings && wget https://packages.openvpn.net/as-repo-public.asc -qO /etc/apt/keyrings/as-repository.asc

echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/as-repository.asc] http://packages.openvpn.net/as/debian noble main">/etc/apt/sources.list.d/openvpn-as-repo.list

apt update && apt -y install openvpn-as