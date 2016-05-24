#!/bin/bash

import timer
import git_check_remote_updated
import pull
import get_source_dir

function bash_lib_update() {
	local dir
	timer
	get_source_dir dir
	pushd $dir >> /dev/null
	if git_check_remote_updated origin ; then
		print red "Remote origin has new commits : initiating update\n"
		pull
	fi
	popd >> /dev/null
	timer_stop
}
