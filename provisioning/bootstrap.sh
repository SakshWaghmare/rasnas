#!/bin/bash

set -e

echo "========================================"
echo "Updating Ubuntu..."
echo "========================================"

sudo apt update
sudo apt upgrade -y

echo "========================================"
echo "Installing Required Packages..."
echo "========================================"

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

echo "========================================"
echo "Installing Docker..."
echo "========================================"

curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh

sudo usermod -aG docker vagrant

sudo systemctl enable docker
sudo systemctl start docker

echo "========================================"
echo "Installing kubectl..."
echo "========================================"

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

chmod +x kubectl

sudo mv kubectl /usr/local/bin/

echo "========================================"
echo "Installing Minikube..."
echo "========================================"

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

chmod +x minikube-linux-amd64

sudo mv minikube-linux-amd64 /usr/local/bin/minikube

echo "========================================"
echo "Installing Helm..."
echo "========================================"

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

echo "========================================"
echo "Versions Installed"
echo "========================================"

docker --version

docker compose version

kubectl version --client

minikube version

helm version

echo "========================================"
echo "Bootstrap Completed Successfully"
echo "========================================"