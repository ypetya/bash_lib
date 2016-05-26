#!/bin/bash

# This file is the initial entry point of the bash_lib
# every script can individually source by using the require function
# or loading this lib first
#
# $ require fav killall_java git_helpers

DEBUG=0

# require import - which can be used by any local script
function init() {
	local DIR="${BASH_SOURCE%/*}"
	if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
	source "$DIR/get_source_dir.sh"
	source "$DIR/import.sh"
}
init

import print_info

# require all the parameters
function require() {
	for param_in in "$@" ; do
		local param="${param_in%%.sh}"
		local fn_name="${param#*/}"
		import "$param"

		if [ "$#" == "1" ] ; then
			print_info "$fn_name"
		fi
	done
}

[[ "$BASH_SOURCE" == "$0" ]] && require "${@:1}"
