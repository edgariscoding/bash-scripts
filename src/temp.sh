
# User greeting.
echo "Good day, $1! Nice to meet you!"

# Sets default login status for current user.
LOGINSTATUS="logged in"

# Checks for optional EUID argument.
if [ -n "$2" ]
then
    # Sets current current user to optional EUID.
    USER=$2
    # Checks login status and updates $LOGINSTATUS if EUID user is logged out.
    who | grep -q $2
    if [ $? -ne 0 ]
    then
        LOGINSTATUS="NOT logged in"
    fi
fi

while :
do
    # Prints options menu.
    printf "%s\n" "+-------------------------------------------------------------------|" \
        	      "Enter one of the following options:                                 |" \
                  "1) List and count all non-hidden files in the current directory.    |" \
                  "2) Check if given user (default = current user) is logged in, then  |" \
                  "   ... list all active processes for that user.                     |" \
                  "3) List the sizes and names of the 10 largest files and directories |" \
                  "   ... in the current directory.                                    |" \
                  "4) Exit this shell program.                                         |" \
                  "+-------------------------------------------------------------------+"

	# Reads the user input and saves to OPT.
    printf '> '
    read -r OPT

	case $OPT in
        # Displays non-hidden files in current directory (not including directories).
        1)  echo "==> Total number of files: $(($(ls -l | grep -v ^d | wc -l)-1))"
            ls -p | grep -v / | column -x ;;
		# Processes running by current user.
        2)  echo "==> Active processes for $USER ($LOGINSTATUS):"
            ps -ef | grep $USER ;;
        # Prints 10 largest files and directories sorted in descending order.
        3)  echo "==> Size and Name of 10 largest files and directories:"
            du -sk *| sort -n -r | head -10
            du -skc *| sort -n -r | head -1 ;;
        # Quits program.
		*)  echo "Thanks, $1! Have a great day!"; exit ;;
	esac
done
*/