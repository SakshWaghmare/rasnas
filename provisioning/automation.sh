#!/bin/bash

set -e

echo "========================================="
echo "Provisioning Automation VM"
echo "========================================="

sudo apt-get update -y
sudo apt-get upgrade -y

echo "Installing prerequisites..."
sudo apt-get install -y \
    git \
    curl \
    wget \
    unzip \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    python3 \
    python3-pip

####################################################
# Docker
####################################################

echo "Installing Docker..."

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
# Java
####################################################

sudo apt-get install -y openjdk-17-jdk

####################################################
# Jenkins
####################################################

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | \
sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ | \
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update
sudo apt-get install -y jenkins

sudo systemctl enable jenkins
sudo systemctl start jenkins

####################################################
# Ansible
####################################################

sudo apt-get install -y ansible

####################################################
# Verify Installation
####################################################

echo ""
echo "Installed Versions"
echo "=================="

docker --version
docker compose version
git --version
python3 --version
java -version
ansible --version | head -n 1

echo ""
echo "Automation VM Provisioned Successfully"