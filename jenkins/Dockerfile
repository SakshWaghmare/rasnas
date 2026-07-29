FROM jenkins/jenkins:lts-jdk17

USER root

# Install required packages
RUN apt-get update && \
    apt-get install -y \
        curl \
        wget \
        git \
        python3 \
        python3-pip \
        apt-transport-https \
        ca-certificates \
        gnupg \
        lsb-release

# Install Docker CLI
RUN curl -fsSL https://get.docker.com | sh

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

USER jenkins
