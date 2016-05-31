#!/bin/bash

# converts a bash_lib shell script's relative path into a package name
function convert_filename_to_package() {
	local DIR="${1?param missing - base directory name}"
	if (( $# == 2 )) ; then
		local file="${2}"
		file="${file#$DIR}"
		file="${file%.sh}"
		file="${file//\//.}"
		echo "$file"
	else
		sed 's|'$DIR'/||;s|.sh$||' | \
		sed -r "s|/|.|g"
	fi
}
