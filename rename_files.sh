#!/bin/bash

import find_blacklist

function rename_files() {
	local change_from="${1? param missing - change_from}"
	local change_to="${2? param missing - change_to}"

	local files="$( find . -type f $find_blacklist )"

	for f in $files ; do
		# FIXME should introduce filter for files
		print red "$f"
		print " -> "
		print green "${f//$change_from/$change_to}\n"
	done

	if ask_user 'Is this correct?' ; then
		for f in $files ; do
			mv -v "$f" "${f//$change_from/$change_to}"
		done
	fi

}
