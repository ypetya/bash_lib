#!/bin/bash

import create_colors_map

# first parameter is optional, and it tries to get a color code for it
# print yellow 'sunshine\n'
function print() {
	if (( $# > 1 )) ; then
		local color="${colors[$1]}"
		if [ ! "$color" == '' ] ; then
			shift
			printf "\e[${color}m$@\e[0m"
			return
		fi
	fi
	
	printf "$@"
}
