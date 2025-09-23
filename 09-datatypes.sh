#!/bin/bash

#Everything in shell considered as string
NUMBER1=100
NUMBER2=200
Name=Devops

SUM=$(($NUMBER1+$NUMBER2+$Name))

echo "The Sum is:$SUM"

# Size = 4, Max Index = 3
LEADERS=("Modi" "Putin" "Truedo" "Trump")

echo "All Leaders : ${LEADERS[@]}"
echo "First Leader : ${LEADERS[4]}"