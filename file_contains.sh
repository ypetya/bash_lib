#!/bin/bash

function file_contains() {
	local result=$(
		sed -nr \
			"s/${1? param missing : string to find}/1/p" \
			"${2? param missing - file}" | \
			wc -l
	)
	if (( result == 0 )) ; then
		return 1
	fi
}
