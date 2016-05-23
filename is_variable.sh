#!/bin/bash

function is_variable() {
	local variable_name="${1? param missing : please specify variable name}"
	if ! declare -p "$variable_name" >& /dev/null ; then 
		return 1
	fi
}
