#!/bin/bash

import sed_extract_imports

function list_imports_of_file() {
	local file="${1? param missing - file}"
	local ext="${file##*.}"
	debug "ext: $ext"
	local sed_extract="${sed_extract_imports[$ext]}"

	local imports=( $( sed -nr "$sed_extract" "$file") )

	for i in ${imports[@]} ; do
		echo $i
	done
}
