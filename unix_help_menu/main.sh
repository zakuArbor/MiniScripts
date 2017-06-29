sh main_menu.sh
if test $# -gt 1
then
    echo
    echo -e "\tusage: $0 [option]" >&2
    exit 1
fi

if test $# -eq 1
then
	cmd=$1
else
	read cmd
fi

case "$cmd" in
	"help")
		echo "usage: $0 [help|file|text|status]"
	;;
	"file")
		clear
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
		echo usage: $0 [option] >2
	;;
esac
