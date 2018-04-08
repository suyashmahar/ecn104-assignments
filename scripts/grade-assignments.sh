#!/usr/bin/env bash

# Scripts assumes that all the testbenches are in the temp directory
tempDirectory="temp"
curDir=$("pwd")

if [ ! -d "$tempDirectory" ]; then
    mkdir "$curDir/$tempDirectory"
    echo "'temp' directory didn't exist, created one."
    echo "Copy testbenches to the temp directory and re run this scripts"
    return
fi

# Loop over all the directories
for f in ./*/; do
    read -p "Continue with $f (y/n)?" choice
    case "$choice" in 
	n|N ) exit;;
	* ) echo "invalid";;
    esac
    if [ ! "$f" == "./temp" ] | [ ! "$f" == "." ]; then
	printf "$f\n"
	echo "./$tempDirectory/"
	cp "$f/"* "$tempDirectory/"
    fi
    rm "./$f/*"
done
