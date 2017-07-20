sh main_menu.sh
if test $# -gt 0
then
    echo
    echo -e "\tusage: $0" >&2
    exit 1
fi

read cmd

case "$cmd" in
	"help")
		echo "usage: $0"
	;;
	"1") #file
		clear
		sh file.sh
	;;
	"2") 
		clear
		sh test.sh
	;;
	"3")
		clear
		sh system.sh
	;;
	"4")
		clear
		exit
	;;
	*)
		echo usage: $0 >&2
		exit 1
	;;
esac
