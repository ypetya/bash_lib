#!/bin/bash

import is_mingw

if is_mingw ; then

function is_job_running() {
	local job="${1? param missing - please specify a runnable job}"
	local _is_job_running=$(jobs | grep -E "Running.*$job")
	if [ -z "$is_job_running" ]; then
		return 1 # it is not running		
	fi
	# it is running
}

else
	error " not mingw "
	return 1
fi
