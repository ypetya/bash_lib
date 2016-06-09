#!/bin/bash

import print.print
import find_blacklist
import string.match

function rename_files() {
	local change_from="${1? param missing - change_from}"
	local change_to="${2? param missing - change_to}"
	local files=$( eval find . -type f  $find_blacklist )
	for f in $files ; do
		if string.match $f $change_from ; then
			print red "$f"
			print " -> "
			print green "${f//$change_from/$change_to}\n"
		fi
	done

	if ask_user 'Is this correct?' ; then
		for f in $files ; do
			if string.match $f $change_from ; then
				mv -v "$f" "${f//$change_from/$change_to}"
			fi
		done
	fi

}
