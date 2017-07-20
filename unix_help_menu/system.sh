usage="usage: $0 [option]"
if test $# -gt 2
then
	echo $usage >&2 
	exit 1
else
	if test $# -eq 0
	then
		sh system_status_menu.sh
		read cmd
		cmd=$1
	fi
fi
case "$cmd" in
	"1") #Display current date and time
		echo date "+%D %R"
	;;
	"2") #Current Disk usage
	;;
	"3") #List current local and environment 
	;;
	"4") #Display Process status information
	;;
	"5") #Return to main menu
		sh main.sh
	;;
	*)
		echo $usage >&2
		exit 1
	;;
esac


date +%D
