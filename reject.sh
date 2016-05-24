#!/bin/bash


# This function rejects array elements
#
# input parameters
# $1 : associative array variable name
# $2 : callback - or evaluated expression
#
# the passed in callback is called with every $1:key,$2:element
# the return code of the callback [0] -> marks element to be rejected
function reject() {
	local arr_var="${1? param missing - array name}[@]"
	declare -a my_arr=( "${!arr_var}" )
	local val
	for key in ${!my_arr[@]} ; do
		debug $key
		val=${my_arr[$key]}
		debug $val

		if ( eval "${2? param missing - callback} $key $val" ) ; then
			my_arr[$key]=''
		fi
	done

	# compact
	eval "${1}=( ${my_arr[@]} )"
}
