#!/bin/bash

import sed_git_extract_commiter print

function grep_git() {
	local file_name
	local change_line
	local matching_line
	grep -rn "$@" | while read match ; do
	# FIXME : cutting ':' -s
		file_name="$(echo $match | cut -d ':' -f 1)"
		change_line="$(echo $match | cut -d ':' -f 2)"
		matching_line="$(echo $match | cut -d ':' -f 3)"
		commiter=$( git blame "$file_name" -e -w | \
		 sed -r "$sed_git_extract_commiter" | \
		 sed -n "${change_line}p" \
		 )
		 
		print yellow "$file_name"
		print ":$change_line"
		print green "$commiter"
		print ' '
		echo "$matching_line"
	done
}
