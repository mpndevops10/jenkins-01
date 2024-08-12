#!/bin/bash
#Author:Prof Elvis N
#Company: Etech Co. llc
sudo apt update
sudo apt install default-jdk -y
sudo adduser tomcat
sudo usermod -d /opt/tomcat tomcat
sudo usermod -s /bin/false tomcat
cd /tmp
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.93/bin/apache-tomcat-9.0.93.tar.gz
sudo mkdir /opt/tomcat
sudo chmod 777 -R /opt/tomcat
sudo tar -xvf /tmp/apache-tomcat-9.0.93.tar.gz -C /opt/tomcat
sudo ln -s /opt/tomcat/apache-tomcat-9.0.93 /opt/tomcat/latest
sudo chown -RH tomcat: /opt/tomcat/latest
sudo sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'
echo "Apache Tomcat installation completed successfully."
sudo hostnamectl set-hostname tomcatsrv
bash