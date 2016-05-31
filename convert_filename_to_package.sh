#!/bin/bash

# converts a bash_lib shell script's relative path into a package name
function convert_filename_to_package() {
	local DIR="${1?param missing - base directory name}"
	sed 's|'$DIR'/||;s|.sh$||' | \
	sed -r "s|/|.|g"
}
