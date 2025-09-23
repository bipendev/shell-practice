#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo " ERROR:: Please run the script with root privilege"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo " ERROR:: Installing MySQL is failure "
else
    echo " Installing MySQL is SUCCESS "
fi