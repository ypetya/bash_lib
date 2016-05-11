#!/bin/bash


# This function rejects array elements
#
# input parameters
# $1 : array variable name
# $2 : callback - or evaluated expression
#
# the passed in callback is called with every $1:key,$2:element
# the return code of the callback [0] -> marks element to be rejected
function reject() {
	:${1? missing parameter - target array to be used in reject}
	declare -a my_arr=( ${!1} )
	
	for key in ${!my_arr[@]} ; do
		if "$2" key ${my_arr[$key]} ; then
			my_arr[$key]=''
		fi
	done
	
	# compact
	eval "${1}=( ${my_arr[@]} )"
}
