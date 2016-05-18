#!/bin/bash

import print git_get_committers_of_file list_get_row

# TODO rename it grep_blame
function grep_git() {
	local file_name
	local last_file_name='-1'
	local change_line
	local matching_line
	local committers
	# -i insensitive
	# -r recursive
	# -n containing line numbers
	grep -irn "$@" | while read match ; do
	# FIXME : cutting ':' -s
		file_name="$(echo $match | cut -d ':' -f 1)"
		change_line="$(echo $match | cut -d ':' -f 2)"
		matching_line="$(echo $match | cut -d ':' -f 3,4,5)"
		if [ ! "$file_name" == "$last_file_name" ] ; then
			committers=( $(git_get_committers_of_file "$file_name") )
		fi
		
		last_file_name="$file_name"
		print yellow "$file_name"
		print ":$change_line "
		print green "${committers[$change_line]}"
		print ' '
		echo "$matching_line"
	done
}

