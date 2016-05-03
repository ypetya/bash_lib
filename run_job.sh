#!/bin/bash

source_relative is_job_running

function run_job() {
	local job="${1? param missing - please specify a runnable job}"
	
	if ! is_job_running "$job" ; then
		$job 1>&2 >> /dev/null &
		# PID_RUN="$!"
	fi
}
