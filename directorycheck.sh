#!/bin/bash

while true; do
    read -p "Enter directory path (or type 'exit' to quit): " DIR

    # Exit condition
    if [ "$DIR" == "exit" ]; then
        echo "Goodbye!"
        break
    fi

    # Check if directory exists
    if [ ! -d "$DIR" ]; then
        echo "Directory does not exist. Try again."
        continue
    fi

    # Count files
    FILES=$(find "$DIR" -maxdepth 1 -type f | wc -l)
    TODAY=$(date +%Y-%m-%d)

    # Conditional message
    if [ $FILES -gt 5 ]; then
        echo "There are many files here!"
    else
        echo "Not too many files."
    fi

    echo "Today's date is: $TODAY"
    echo "-------------------------------"
done

