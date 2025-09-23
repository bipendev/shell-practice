#!/bin/bash

#Everything in shell considered as string
NUMBER1=100
NUMBER2=200
Name=Devops

SUM=$(($NUMBER1+$NUMBER2+$Name))

echo "The Sum is:$SUM"

LEADERS=("Modi" "Putin" "Truedo" "Trump")

echo "All Leadres : ${LEADERS}[@]"