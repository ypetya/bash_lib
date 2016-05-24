#!/bin/bash

# Eg:
# require create_week_days
# for_each week_days echo
function for_each() {
	local arr_name="${1? param missing - array_name}[@]"
	local cb_name="${2? param missing - callback}"

	local arr=( "${!arr_name}" )

	for key in ${!arr[@]} ; do
		debug "$cb_name ${arr[$key]} $key"
		$cb_name ${arr[$key]} $key
	done
}
