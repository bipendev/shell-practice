#!/bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo " ERROR:: Please run the script with root privilege"
    exit 1 # other than  0 is failure
fi

VALIDATE (){ # functions receive inputs through args
    if [ $1 -ne 0 ]; then
        echo " ERROR:: Installing $2 is failure "
        exit 1
    else
        echo " Installing $2 is SUCCESS "
    fi

}

dnf install mysql -y

VALIDATE $? "MySQL"

dnf install nginx -y

VALIDATE $? "nginx"

dnf install python3 -y

VALIDATE $? "python"