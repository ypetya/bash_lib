#!/bin/bash

import file.list_import_vars
import find_blacklist
import print.print print.debug

function remove_unused_imports() {
	local files=( $( eval find . -type f $find_blacklist ) )
	local imports
	local count
	declare -i count
	for file in ${files[@]} ; do
		imports=( $( file.list_import_vars $file ) )

		for i in ${imports[@]} ; do
			debug "$file import $i"
			count=$( sed -nr "/${i}/p" $file | wc -l )
			debug " has $count occurences"
			if (( $count == 1 )) ; then
				print "$file has an unused import : "
				print red "$i"
				print green " fixing.\n"
				sed -ri "s/^import.*$i.*$//g" $file
			fi
		done
	done
}
