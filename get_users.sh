#!/bin/bash
# get_users - A script to obtain information about users, groups and their permitions

# show_users_param - parameter which show scope of information about users to provide
# value  -  all - info about all users
# value  -  login - info only about users which can log to system
# value  - nologin - info only about users which can't log to system  
show_users_param=$1

if [ "$#" -ne 1 ]; then
	echo "Illegal number of parameters"
	exit 1
fi
case "$1" in
-all ) 
	echo "All users in system:"
	cut -d: -f1 /etc/passwd
	 ;;
-login )
	echo "All users who can log in system:" 
	awk -F':' '$2 ~ "\$" {print $1}' /etc/shadow
	 ;;
-nologin )
	echo "All users who cant log in system"
	awk -F':' '$2 ~ "\*" {print $1}' /etc/shadow
	;; 
* ) 
	echo "$1 is not an option"
	;;
esac

