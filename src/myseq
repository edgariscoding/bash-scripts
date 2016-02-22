# =====================================================================
# Name:		Edgar Sanchez
# Course:	CSCE 3600
# Date:		Feb 22, 2016
# Title:	Minor Assignment 4-1
# Version:	1.0
# Description:	A bash script called myseq that prints a 
#               sequence of integers to the screen based on 
#               the command line arguments..
# Format:	myseq [start] stop [step]
# =====================================================================

#!/usr/bin/env bash

START=1     # Optional argument, defaults to 1
STOP=1      # Required, may be less than $START
STEP=1      # Optional argument, defaults to 1

# Calculates and prints sequence of integers based on input
function calculate {
    # Loops through range of integers from $START to $STOP in $STEP increments
    # REQUIRES BASH v4.0+
    for i in $(eval echo "{$START..$STOP..$STEP}")
        do
            echo $i
        done
}

# Verifies number of arguments provided by user, assigns
# those values to corresponding variables, and calls calculate function
if [ $# == 3 ]; then
    START=$1
    STOP=$2
    STEP=$3
    calculate
elif [ $# == 2 ]; then
    START=$1
    STOP=$2
    calculate
elif [ $# == 1 ]; then
    # If only one argument is provided, it is assigned to $STOP
    STOP=$1
    calculate
else
    # If incorrect arguments are provided, provide usage and exit with error code
    echo "usage: myseq [start] stop [step]"
    exit 127
fi

exit 0