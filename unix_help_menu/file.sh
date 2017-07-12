usage=usage: $0 [option file]
if test $# -gt 2
then
	echo $usage 
else
	if test $# -eq 0
	then
		sh file_management_menu.sh
	fi
fi

read $cmd $file
case "$cmd" in
	1) #Display content of a file
			
	;;
	2) #Remove a file 
		clear
	;;
	3) #Copy a file
		clear
	;;
	4) #List a file
		clear
	;;
	5) #Size of a file
	;;
	6) #Return to main menu
		sh main.sh
	*)
		echo $usage >&2
		exit 1
	;;
esac
