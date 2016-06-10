#!/bin/bash

function file.find_first_in_parrent() {
	local start_dir="${1? param missing - start_dir}"
	local file_name="${2? param missing - file_name}"

	while ! is_file "$start_dir/$file_name" && (( ${#start_dir} > 0 )) ; do
		start_dir="${start_dir%/*}"
	done

	if (( ${#start_dir} > 0 )) ; then
		echo "$start_dir/$file_name"
	fi
}
