#!/bin/bash

echo -e "Demo on If , If Else & Else If Usage" 

ACTION=$1

if [ "$ACTION" == "start" ] ; then 
   echo -e "\e[32m Starting shipping service \e[0m"
   
fi
echo "It has not met any conditions"
exit 100
