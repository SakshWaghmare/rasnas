FROM jenkins/jenkins:lts-jdk17

USER root

RUN apt-get update && \
    apt-get install -y \
    git \
    curl \
    wget \
    python3 \
    python3-pip

USER jenkins
