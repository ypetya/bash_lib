function fix_mingw() {
	export LS_COLORS='di=0;35'

	# useful for mingw compatibility
	if [ ! -z "$USERNAME" ] && [ -z "$USER" ] ; then
	  export USER=$USERNAME
	elif [ ! -z "$USER" ] && [ -z "$USERNAME" ] ; then
	  export USERNAME=$USER
	fi
}
