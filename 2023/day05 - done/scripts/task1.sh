#!/bin/sh

# Check if 3 arguments are given
if [ "$#" -ne 3 ]
then
    echo "Please, use the following sequence: ./task1.sh <directory-name> <start-number> <end-number>"
    exit 1
fi

# Store the three arguments into variable
directory_name=$1
start_number=$2
end_number=$3

# Create directories
for ((i=start_number; i<=end_number; i++)); 
do 
    mkdir "$directory_name$i"
done

echo "The directories have been successfully created"