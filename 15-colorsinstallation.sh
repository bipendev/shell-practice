#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)




if [ $USERID -ne 0 ]; then
    echo  " ERROR:: Please run the script with root privilege"
    exit 1 # other than  0 is failure
fi

VALIDATE (){ # functions receive inputs through args
    if [ $1 -ne 0 ]; then
        echo -e " Installing $2 ....$R FAILURE $N "
        exit 1
    else
        echo -e " Installing $2 ....$G SUCCESS $N "
    fi

}


dnf list installed mysql
# Install if it is not found
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo  -e "MySQL already exist ....$G SKIPPING $N "
fi


dnf list installed nginx
# Install if it is not found
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already exist ....$G SKIPPING $N "
fi


dnf list installed python
# Install if it is not found
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "python3 already exist ....$G SKIPPING $N "
fi
