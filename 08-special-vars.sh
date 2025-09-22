#!/bin/bash

echo " All Variables passed to the script: $@"
echo " All Variables passed to the script: $*"
echo " Current script name: $0"
echo " Current directory: $PWD"
echo " Who is running the script: $USER"
echo " Home directory of the user: $HOME"
echo " PID of the SCRIPT: $$"
sleep 50 &
echo " PID of the last command in the background: $!"
check this $#