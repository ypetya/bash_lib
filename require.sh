#!/bin/bash

# This file is the initial entry point of the bash_lib
# every script can individually source by using the require function
# or loading this lib first
# E.g:
# $ require fav killall_java

DEBUG=${DEBUG:-0}

# require import - which can be used by any local script
function init() {
	local DIR="${BASH_SOURCE%/*}"
	if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
	source "$DIR/import.sh"
}
init

import -f print.info

# require all the parameters
# give back some human readable info on requiring a single dependency
# require will force import to reload (source) the code from disk
function require() {
	for dep in "$@" ; do
		import -f "$dep"
		if [ "$#" == "1" ] ; then
			print.info "$dep"
		fi
	done
}

[[ "$BASH_SOURCE" == "$0" ]] && require "${@:1}"
