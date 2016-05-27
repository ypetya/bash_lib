#!/bin/bash

import get_file_type
import print debug
import string_match_regex
# list files containing specific strings in file-type
# recursing from the current dir
function find_files_by_type() {
	local look_for=${1?param missing - look_for}

	local files="$(find . -type f)"
	local file_type

	for file in $files ; do
		file_type="$(get_file_type $file)"
		debug "$file : $file_type"
		if string_match_regex "$file_type" "$look_for" ; then
			print "$file"
			print " : "
			print yellow "$file_type\n"
		fi
	done
}
