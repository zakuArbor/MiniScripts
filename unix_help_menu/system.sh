usage="usage: $0 [option]"
if test $# -gt 1
then
	echo $usage >&2 
	exit 1
else
	if test $# -eq 0
	then
		sh system_status_menu.sh
		read cmd
	else
		cmd=$1
	fi
fi
case "$cmd" in
	"1") #Display current date and time
		date "+%D %R"
	;;
	"2") #Current Disk usage
		df -h
	;;
	"3") #List current local and environment 
		echo
	;;
	"4") #Display Process status information
		echo
	;;
	"5") #Return to main menu
		sh main.sh
	;;
	*)
		echo $usage >&2
		exit 1
	;;
esac


