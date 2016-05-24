#!/bin/bash

# TODO this find should be improved by changing the if with a callback
# like in reject
function array_find() {
	local pattern=${1? param missing - pattern }
	local out_arr=${2? param missing - array name}[@]
	local arr=("${!out_arr}")

	for item in ${arr[@]} ; do
		if [[ "$item" =~ "$pattern" ]] ; then
			print "$item\n"
		fi
	done
}
