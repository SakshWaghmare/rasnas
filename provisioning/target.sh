#!/bin/bash

set -e

echo "========================================="
echo "Provisioning Target VM"
echo "========================================="

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install -y \
git \
curl \
wget \
unzip \
software-properties-common \
apt-transport-https \
ca-certificates \
gnupg \
lsb-release

####################################################
# Docker
####################################################

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install -y \
docker-ce \
docker-ce-cli \
containerd.io \
docker-buildx-plugin \
docker-compose-plugin

sudo usermod -aG docker vagrant

####################################################
# Enable Docker
####################################################

sudo systemctl enable docker
sudo systemctl start docker

####################################################
# Pull Vulnerable App
####################################################

sudo docker pull vulnerables/web-dvwa

####################################################
# Verify
####################################################

echo ""
echo "Installed Versions"
echo "=================="

docker --version
docker compose version

echo ""
echo "Target VM Provisioned Successfully"