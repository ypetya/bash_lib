#!/bin/bash

function where_is_function() {
	local fn="${1? param missing - please pass a function name}"
	
	# Turn on extended shell debugging
	shopt -s extdebug

	# Dump the function's name, line number and fully qualified source file  
	declare -F $fn

	# Turn off extended shell debugging
	shopt -u extdebug
}
