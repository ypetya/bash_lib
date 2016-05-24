#!/bin/bash

import file_contains

function list_files_not_contain() {
	local file_pattern="${1? param missing - file_pattern}"
	local string="${2? param missing - string}"
	local files=( $( find source -iname $file_pattern ) )

	debug "${#files[@]} files matching"

	for file in "${files[@]}" ; do
		if ! file_contains "$string" "$file" ; then
			print "$file\n"
		fi
	done
}
