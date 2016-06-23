#!/bin/bash

import print.print print.debug
import file.list_import_vars
import find.blacklist

function find_unused_imports() {
	local files=( $( find.blacklist . -type f ) )
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
				print red "$i\n"
			fi
		done
	done
}
