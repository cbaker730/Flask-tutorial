#!/bin/bash

# This script sets up docker

# Uninstall old docker versions, if any
sudo apt-get remove docker docker-engine docker.io containerd runc

# Update and install dependencies
sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release -y

# Add docker's GPG key and set up the stable repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install the latest version of docker
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose

# Test to see if it all worked
sudo docker run hello-world
docker-compose --version
