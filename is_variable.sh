#!/bin/bash

function is_variable() {
	local variable_name="${1? param missing : please specify variable name}"
	if ! declare -p "$variable_name" 2>&1 > /dev/null ; then 
		return 1
	fi
}
