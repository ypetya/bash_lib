#!/bin/bash

import print.print git.get_committers_of_file

# TODO use git grep it's much faster
function git.grep() {
	local file_name
	local last_file_name='-1'
	local change_line matching_line committers match

	git grep -ni "$@" | while read match ; do
		if (( ${#match} > 0 )) ; then
			debug "$match"
			file_name="$(echo $match | cut -d ':' -f 1)"
			change_line="$(echo $match | cut -d ':' -f 2)"
			matching_line="$(echo $match | cut -d ':' -f 3,4,5,6)"
			if [ ! "$file_name" == "$last_file_name" ] ; then
				committers=( $(git.get_committers_of_file "$file_name") )
			fi

			last_file_name="$file_name"
			print yellow "$file_name"
			print ":$change_line "
			print green "${committers[$change_line]}"
			print ' '
			echo "$matching_line"
		fi
	done
}

