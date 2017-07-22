#!/bin/sh
check_update_script="/usr/lib/update-notifier/apt-check"
update="$("$check_update_script" 2>&1)"
pattern=";*"
update="${update/$pattern}"

if test $update > 0
then
	sudo apt-get update
	sudo apt-get upgrade
fi

if test -f "/var/run/reboot-required"
then
	shutdown -r now 2>/dev/null
fi

