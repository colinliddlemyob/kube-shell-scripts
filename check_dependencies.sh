#!/bin/bash
# Iterate through dependencies list and check that they exist on the system

DEPENDENCIES_SATISFIED=1
DEPENDENCIES_FILE="dependencies.list"

while read -r line; do
	echo "Checking $line installed"
	if ! which $line >/dev/null 2>&1; then
		echo "Error: dependency $line not found"
		DEPENDENCIES_SATISFIED=0
	fi
done < $DEPENDENCIES_FILE

if [ $DEPENDENCIES_SATISFIED -eq 0 ]; then
	echo "Please install missing dependencies"
	exit 1
fi

