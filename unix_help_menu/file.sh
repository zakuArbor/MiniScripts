usage="usage: $0 [option file]"
cat_error=": No such file or is a directory"
file_error=": No such file or directory"
if test $# -gt 2
then
	echo $usage 
else
	if test $# -eq 0
	then
		sh file_management_menu.sh
		read cmd
	else
		if test $# -eq 2
		then
			file=$2
		fi
		cmd=$1
	fi
fi

if test "$cmd" != 6 && [ -z $file ]
then
	echo -ne "\tEnter file name: "
	read file
fi
case "$cmd" in
	"1") #Display content of a file
		if test -f $file
		then	
			cat $file
		else
			echo $file$cat_error
		fi
	;;
	"2") #Remove a file
		if test -f $file
		then
			rm $file
		else
			if test -d $file
			then
				rm -r $file
			else
				echo $file$file_error
			fi
		fi 
	;;
	"3") #Copy a file
		if test -s $file
			then
				i=0
				while test -s "$file"$i
				do
					i=`expr $i + 1`
				done
			else 
				echo $file$file_error
		fi
		if test -f $file
		then
			cp $file "$file"$i
		else 
			if test -d $file
			then
				cp -r $file "$file"$i
			fi
		fi
	;;
	"4") #List a file
		ls -l $file
	;;
	"5") #Size of a file
	;;
	"6") #Return to main menu
		sh main.sh
	;;
	*)
		echo $usage >&2
		exit 1
	;;
esac
