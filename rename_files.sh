#!/bin/bash

import print.print
import find_blacklist

function rename_files() {
	local change_from="${1? param missing - change_from}"
	local change_to="${2? param missing - change_to}"
	# FIXME filter files by introducing a working file_pattern
	#local find_pattern="'""*$change_from*""'"
	#debug "find . -type f -iname $find_pattern $find_blacklist"
	#local files=$( eval find . -type f -iname '$find_pattern' $find_blacklist )

	#debug "$files"
	# TODO introduce find subdir files with blacklist, can be an alternative
	local files=$( eval find . -type f )
	for f in $files ; do
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
