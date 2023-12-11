#!/bin/bash/

# Conditions helps us to execure something only if SOME-FACTOR is true or false.


# Syntax of case

# case $var in 
#     opt1) commands-x ;;
#     opt2) commans-y ;;
# esac
ACTION=$1                  # $1 refres first command line argument

case $ACTION in 
    start)
        echo -e "\e[32m Starting shipping service \e[0m"
        exit 0
        ;;
    stop)
        echo -e "\e[31m Stopping shipping service \e[0m"
        exit 1
        ;;
    restart)
        echo -e "\e[33m Restarting shipping service \e[0m"
        exit 3
        ;;
    *)
        echo -e "\e[35m Valid options are start or stop or restart only \e[0m"
        echo -e "\e[33m Example Usage: \e[0m  \n\t\t bash script.sh start"

esac