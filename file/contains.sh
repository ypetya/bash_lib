#!/bin/bash

function file.contains() {
	local result=$(
			grep -c "${1? param missing : string to find}" \
			"${2? param missing - file}"
	)
	if (( result == 0 )) ; then
		return 1
	fi
}
