#!/bin/bash

echo "Scriptname : $0"
echo "Number of arguments: $#"
echo "All arguments passed (seperate): $@"
echo "All arguments passed (string): $*"
echo "Exit status of last command: $?"
echo "PID of current script: $$"
sleep 10 &
echo "PID of last background process: $!"
echo "Current user name : $USER"
echo "User's home directory: $HOME"
echo "Current working directory: $PWD"

