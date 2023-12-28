#!/bin/bash

UID=$(id -u)

if [ $UID -ne 0 ] ; then 
   echo -e "\e[31m This script is expected to be executed with sudo or as a root user\e[0m"
   echo -e "\e[35m Example Usage: \n\t\t \e[0m sudo bash scriptName componenteName"
   exit 1
fi

echo -e "***** \e[35m Configuring frontend \e[0m *****"

echo -n "Installing Nginx :"
yum install nginx -y      >/tmp/frontend.log
if [ $? -eq 0 ] ; then 
   echo -e "\e[32m Success \e[0m"
else 
   echo -e "\e[31m Failure \e[0m"
fi 

# systemctl enable nginx
# systemctl start nginx
# curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
# cd /usr/share/nginx/html
# rm -rf *
# unzip /tmp/frontend.zip
# mv frontend-main/* .
# mv static/* .
# rm -rf frontend-main README.md
# mv localhost.conf /etc/nginx/default.d/roboshop.conf