#!/bin/bash

set -e

echo "Updating packages..."

sudo apt update
sudo apt upgrade -y

echo "Installing common packages..."

sudo apt install -y \
    curl \
    wget \
    git \
    unzip \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    software-properties-common

echo "Installing Docker..."

# Remove old versions
sudo apt remove -y docker docker-engine docker.io containerd runc || true

# Docker GPG Key
sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Docker Repository
echo \
"deb [arch=$(dpkg --print-architecture) \
signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update

sudo apt install -y \
docker-ce \
docker-ce-cli \
containerd.io \
docker-buildx-plugin \
docker-compose-plugin

# Allow vagrant user to run Docker
sudo usermod -aG docker vagrant

sudo systemctl enable docker
sudo systemctl start docker