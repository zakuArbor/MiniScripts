#NOTE
#for option 2, we ignore the third paramter regardless if it is given
#for option 4, we ignore all extra parameters

usage="usage: $0 [option pattern file]|[option file]"

file_error=": No such file"
if test $# -gt 3
then
	echo $usage >&2 
	exit 1
fi
if test $# -eq 0
then
    sh text_processing_menu.sh
    read cmd
else
	cmd=$1
fi
if test $# -gt 2
then
	if test "$cmd" -ne 2
	then
		file=$3
	else 
		file=$2
	fi
fi

if test "$cmd" -gt 0 && test "$cmd" -lt 3 && test $# -lt 2 
then
	echo -ne "\tEnter file name: "
	read file
fi

if (test "$cmd" -ge 1) && (test "$cmd" -le 3) && ! test -f $file
then
	echo $file$file_error >&2
	exit 1
fi

case "$cmd" in
	"1") #Search a file for a pattern
		grep $2 $file
	;;
	"2") #Count lines, words, and characters in specified file
		wc -lwc $file
	;;
	"3") #Differences between two files
		if test $# -ne 3
		then
			echo -ne "\tEnter file 2 name: "
			read 'file2'
			if ! test -f $file2
			then
				echo $file2$file_error >&2
				exit 1
			fi
		else
			file2=$file #swap file and file 2
			file=$2
			if ! test -f $file
			then
				echo $file$file_error >&2
				exit 1
			fi
		fi
		diff "$file" "$file2"
	;;
	"4") #Return to main menu
		sh main.sh
	;;
	*)
		echo $usage >&2
		exit 1
	;;
esac

