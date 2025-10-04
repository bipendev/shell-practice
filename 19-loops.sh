#!/bin/bash

# USERID=$(id -u)

# LOG_FOLDER=/var/log/shellscript
# SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
# LOF_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

# mkdir -p $LOG_FOLDER

# echo

# R="\e[31m"
# G="\e[32m"
# Y="\e[33m"
# N="\e[0m"

# if [ $USERID -ne 0 ]; then
#     echo " ERROR: Please run the script with root privilege"
#     exit 1
# fi

# Validate(){
# if [ $1 -ne 0 ]; then
#     echo "Installing $2...$R FAILURE $N" | tee -a $LOG_FILE
#     exit 1
# else
#     echo "Installing $@...$G SUCCESS $N" | tee -a $LOG_FILE
# fi
# }

# for package in $@
# do
#     echo "package is: $package"
# done


#Variables
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER=/var/log/scriptlog
SCRIPT_NAME=$( echo "$0" | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME"

mkdir -p $LOGS_FOLDER

#Condition
if [ "$USERID" -ne 0 ]; then
    echo  -e " Error: Please run the script with root privileges"
    exit 1
fi

VALIDATE(){
if [ "$1" -ne 0 ]; then
        echo -e " Installing $2 ....$R FAILED $N" | tee -a "$LOG_FILE"
    
    else
        echo  -e " Installing $2 .... $G SUCCESS $N" | tee -a "$LOG_FILE"

fi

}

#Install package

for package in  "$@"; do

       # dnf list installed "$package" 

        if ! dnf list installed "$package" &>>"$LOG_FILE"; then
            dnf install "$package" -y &>>"$LOG_FILE"
            VALIDATE $? "$package" 
        else
              
            echo -e " $package already installed...$Y SKIPPING $N"
        fi
    done

