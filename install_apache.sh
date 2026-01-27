#!/bin/bash

set -e

# Variables
TOMCAT_VERSION=9.0.113
TOMCAT_USER=tomcat
INSTALL_DIR=/opt
TOMCAT_HOME=$INSTALL_DIR/apache-tomcat-$TOMCAT_VERSION

# Install required packages
sudo apt update
sudo apt install -y unzip wget default-jdk

# Download Tomcat
cd /tmp
wget https://dlcdn.apache.org/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.zip

# Extract to /opt
sudo unzip apache-tomcat-$TOMCAT_VERSION.zip -d $INSTALL_DIR

# Change port from 8080 to 9090
sudo sed -i 's/port="8080"/port="9090"/' $TOMCAT_HOME/conf/server.xml

# Give execute permission
sudo chmod +x $TOMCAT_HOME/bin/*.sh

# Start Tomcat
sudo $TOMCAT_HOME/bin/startup.sh
