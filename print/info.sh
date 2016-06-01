#!/bin/bash

import is_variable print.print print.error

function print.info() {
	local fn_name="${1? param missing - fn or variable name}"
	local is_a=$(type -t "$fn_name")
	print yellow "$fn_name"
	if [ ! -z "$is_a" ] ; then
		print ' is a '
		print green "$is_a\n"
		#export -f "$fn_name"
	elif is_variable $fn_name ; then
		print ' is a '
		print green "variable\n"
	else
		print ' is '
		error "missing\n"
	fi
}
