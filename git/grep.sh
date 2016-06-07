#!/bin/bash

import print.print git.get_committers_of_file

function git.grep() {
	local file_name
	local last_file_name='-1'
	local change_line
	local matching_line
	local committers
	# -i insensitive
	# -r recursive
	# -n containing line numbers
	grep -irn "$@" $(git ls) | while read match ; do
		file_name="$(echo $match | cut -d ':' -f 1)"
		change_line="$(echo $match | cut -d ':' -f 2)"
		matching_line="$(echo $match | cut -d ':' -f 3,4,5)"
		if [ ! "$file_name" == "$last_file_name" ] ; then
			committers=( $(git.get_committers_of_file "$file_name") )
		fi

		last_file_name="$file_name"
		print yellow "$file_name"
		print ":$change_line "
		print green "${committers[$change_line]}"
		print ' '
		echo "$matching_line"
	done
}

