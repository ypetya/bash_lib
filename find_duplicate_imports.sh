#!/bin/bash

import print.print print.debug
import list_imports_of_file
import find_blacklist

function find_duplicate_imports() {
	local files=( $( eval find . -type f $find_blacklist ) )
	local top_import
	local count
	declare -i count
	for file in ${files[@]} ; do
		top_import=$(list_imports_of_file $file | list_counts_desc | first )
		debug "$file:$top_import"
		count=$( echo $top_import | cut -d ' ' -f 1)
		debug "top import count : $count"
		if (( $count > 1 )) ; then
			print "$file has "
			print red "$top_import\n"
		fi
	done
}
