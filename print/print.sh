import print.create_colors_map

print.create_colors_map
# first parameter is optional, and it tries to get a color code for it
# print yellow 'sunshine\n'
# when a pipe is broken it wont print error messages
function print.print() {
	if (( $# > 1 )) ; then
		local color="${colors[$1]}"
		if [ ! "$color" == '' ] ; then
			shift
			printf "\e[${color}m$@\e[0m" 2> /dev/null
			return
		fi
	fi

	printf "$@" 2> /dev/null
}

alias print="print.print"
