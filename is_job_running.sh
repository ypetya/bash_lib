#!/bin/bash

import is_mingw

# TODO fix this function for *nix
is_mingw || (error " not mingw " && return 1)

function is_job_running() {
	local job="${1? param missing - please specify a runnable job}"
	local _is_job_running=$(jobs | grep -E "Running.*$job")
	if [ -z "$is_job_running" ]; then
		return 1 # it is not running		
	fi
	# it is running
}

