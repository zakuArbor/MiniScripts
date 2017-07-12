sh main_menu.sh
if test $# -gt 0
then
    echo
    echo -e "\tusage: $0 [option]" >&2
    exit 1
fi

read cmd

case "$cmd" in
	"help")
		echo "usage: $0"
	;;
	"file") #file
		clear
		echo "test"
		sh file.sh
	;;
	"text") 
		clear
		sh test.sh
	;;
	"status")
		clear
		sh status.sh
	;;
	"exit")
		clear
		exit
	;;
	*)
		echo usage: $0 >&2
		exit 1
	;;
esac
