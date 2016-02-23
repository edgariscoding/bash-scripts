# =====================================================================
# Name:		Edgar Sanchez
# Course:	CSCE 3600
# Date:		Feb 22, 2016
# Title:	Minor Assignment 4-2
# Version:	1.0
# Description:	A bash script called mybytes that prints information
#               about the files in the current directory based on 
#               command line arguments (of lack thereof).
# Format:	mybytes [file]...
# =====================================================================

#!/usr/bin/env bash

# Initial data variables
ordExecFiles=0
otherFiles=0
dirFiles=0
ordReadFiles=0
totalOrdBytes=0

# Prints table with file data
function printTable() {
    echo "================= file data ================="
    echo "ordinary, readable, executable files  :   $ordExecFiles"
    echo "non-existent or other types of files  :   $otherFiles"
    echo "directory files                       :   $dirFiles"
    echo "ordinary and readable files           :   $ordReadFiles"
    echo "total bytes in ordinary files         :   $totalOrdBytes"
}

# If no arguments are provided, run script on all files within current directory
# otherwise, each argument is evaluated and the varibles increased if a match is found
if [ $# -eq 0 ]; then
    ordExecFiles=`find . -not -path '*/\.*' -maxdepth 1 -type f -perm -u=rwx | wc -l | tr -d ' '`
    dirFiles=`find . -not -path '*/\.*' -maxdepth 1 -mindepth 1 -type d | wc -l | tr -d ' '`
    ordReadFiles=`find . -not -path '*/\.*' -maxdepth 1 -type f -perm -u=rw ! -perm -u=rwx | wc -l | tr -d ' '`
    totalOrdBytes=`find . -not -path '*/\.*' -maxdepth 1 -type f -perm -u=rw -ls | awk '{total += $7} END {print total}'`
else
    for var in "$@" # Iterates through every argument provided and expanded by Bash/Globbing
    do
        # If the argument is true then increase the variable by one and add increase total bytes
        if test -x "$var"; then # Tests if file is executable
            (( ordExecFiles++ ))
            let "totalOrdBytes += `find . -name "$var" -ls | awk '{total += $7} END {print total}'`"
        elif test ! -e "$var"; then # Tests if file exists
            (( otherFiles++ ))
        elif test -d "$var"; then # Tests if file is a directory
            (( dirFiles++ ))
            let "totalOrdBytes += `find . -name "$var" -ls | awk '{total += $7} END {print total}'`"
        elif test -r "$var"; then # Tests if file is readable
            (( ordReadFiles++ ))
            let "totalOrdBytes += `find . -name "$var" -ls | awk '{total += $7} END {print total}'`"
        fi
    done
fi

# Prints the file data table to the screen
printTable