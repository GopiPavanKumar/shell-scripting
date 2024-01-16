#!/bin/bash

USER_ID=$(id -u)
COMPONENT=mongodb
LOGFILE="/tmp/${COMPONENT}.log"
MONGO_REPO="https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo"
SCHEMA_URL="https://github.com/stans-robot-project/mongodb/archive/main.zip"

stat() {
    if [ $1 -eq 0 ] ; then 
        echo -e "\e[32m Success \e[0m"

   else 
        echo -e "\e[31m Failure \e[0m"
    fi
}

if [ $USER_ID -ne 0 ] ; then 
   echo -e "\e[31m This script is expected to be executed with sudo or as a root user\e[0m"
   echo -e "\e[35m Example Usage: \n\t\t \e[0m sudo bash scriptName componenteName"
   exit 1
fi

echo -e "***** \e[35m Configuring ${COMPONENT} \e[0m *****"

echo -n "Configuring $COMPONENT repo"
curl -s -o /etc/yum.repos.d/mongodb.repo $MONGO_REPO
stat $?

echo -n " Installing $COMPONENT :"
yum install -y mongodb-org  &>> ${LOGFILE}
stat $?

echo -n "Enabling $COMPONENT visibilty :"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
stat $?

echo -n "Starting COMPONENT :"
systemctl enable mongo   &>> $LOGFILE
systemctl daemon-reload  &>> $LOGFILE
systemctl restart mongod  &>> $LOGFILE
stat $?

echo -n "Downloding $COMPONENT Schema :"
curl -s -L -o /tmp/mongodb.zip $SCHEMA_URL
stat $?

echo -n "Extracting $COMPONENET"
cd /tmp
unzip -o mongodb.zip   &>> $LOGFILE
stat $?

echo -n "Injecting Schema :"
cd /tmp/mongodb-main
mongo < catalogue.js  &>> $LOGFILE
mongo < users.js      &>> $LOGFILE
stat $?

echo -e "***** \e[35m $COMPONENT Configuration is completed \e[0m *****"