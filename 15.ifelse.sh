#!/bin/bash

echo -e "Demo on If , If Else & Else If Usage" 

ACTION=$1

if [ "$ACTION" == "start" ] ; then 
   echo -e "\e[32m Starting shipping service \e[0m"
   exit 0
elif [ "$ACTION" == "stop" ] ; then 
   echo -e "\e[31m Stopping shipping service \e[0m"
   exit 1
elif [ "$ACTION" == "restart" ] ; then 
   echo -e "\e[33m Restarting shipping service \e[0m"
   exit 1
else 
   echo -e "\e[35m Valid option are start or stop or restart only  \e[0m"
   exit 3
fi