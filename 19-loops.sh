#!/bin/bash

USERID=$(id -u)

LOG_FOLDER=/var/log/shellscript
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOF_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER

echo

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo " ERROR: Please run the script with root privilege"
    exit 1
fi

Validate()
if [ $1 -ne 0 ]; then
    echo "Installing $2...$R FAILURE $N" | tee -a $LOG_FILE
    exit 1
else
    echo "Installing $@...$G SUCCESS $N" | tee -a $LOG_FILE
fi


for package in $@
do
    echo "package is: $package"
done