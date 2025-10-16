#!/bin/bash
# Update system
apt update -y

# Install Java (Jenkins dependency)
sudo apt install fontconfig openjdk-17-jre -y

# Add Jenkins repo and key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null


# Install Jenkins
apt update -y
apt install -y jenkins

# Enable and start Jenkins service
systemctl enable jenkins
systemctl start jenkins

# FireWall actiev
sudo ufw allow 8080/tcp
sudo ufw reload