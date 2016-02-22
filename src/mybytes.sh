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

# File data variables
ordExecFiles=`find . -maxdepth 1 -type f -perm -u=rwx | wc -l | tr -d ' '`
otherFiles=0
dirFiles=`find . -maxdepth 1 -mindepth 1 -type d | wc -l | tr -d ' '`
ordReadFiles=`find . -maxdepth 1 -type f -perm -u=rw ! -perm -u=rwx | wc -l | tr -d ' '`
totalOrdBytes=`find . -maxdepth 1 -type f -perm -u=rw -ls | awk '{total += $7} END {print total}'`

# Prints table with file data
function printTable() {
    if [ $# == 0 ]; then
        echo "================= file data ================="
        echo "ordinary, readable, executable files  :   $ordExecFiles"
        echo "non-existent or other types of files  :   $otherFiles"
        echo "directory files                       :   $dirFiles" #includes hidden dirs
        echo "ordinary and readable files           :   $ordReadFiles"
        echo "total bytes in ordinary files         :   $totalOrdBytes"
    fi
}

printTable