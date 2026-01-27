#!/bin/bash
# Jenkins Installation Script
# OS: Ubuntu 20.04
# Minimum: 2GB RAM, 2 vCPU

set -e

echo "Updating system..."
sudo apt update -y

echo "Installing Java 17..."
sudo apt install -y openjdk-17-jdk

echo "Verifying Java..."
java -version

echo "Installing Maven..."
sudo apt install -y maven

echo "Adding Jenkins GPG key..."
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key \
  | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "Adding Jenkins repository..."
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ \
  | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Updating package list..."
sudo apt update -y

echo "Installing Jenkins..."
sudo apt install -y jenkins

echo "Reloading systemd..."
sudo systemctl daemon-reload

echo "Enabling Jenkins service..."
sudo systemctl enable jenkins

echo "Starting Jenkins..."
sudo systemctl start jenkins

echo "Checking Jenkins status..."
sudo systemctl status jenkins --no-pager

echo "Waiting for Jenkins to initialize..."
sleep 20

echo "Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
