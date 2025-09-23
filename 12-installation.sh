#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo " ERROR:: Please run the script with root privilege"
    exit 1 # other than  0 is failure
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo " ERROR:: Installing MySQL is failure "
    exit 1
else
    echo " Installing MySQL is SUCCESS "
fi