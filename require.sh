#!/bin/bash

# This file is the initial entry point of the bash_lib
# every script can individually source by using the require function
# or loading this lib first
#
# $ require fav killall_java git_helpers


# require source_relative - which can be used by any local script
function init() {
	DIR="${BASH_SOURCE%/*}"
	if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
	source "$DIR/get_source_dir.sh"
	source "$DIR/import.sh"
}

init
# assume require_package is available in all environments
import require_package print

# require all the parameters
function require() {
	for param_in in "$@" ; do
		local param="${param_in%%.sh}"
		import "$param"
		local is_a=$(type -t "$param")
		print yellow "$param"
		
		if [ ! -z "$is_a" ] ; then
			print ' required as a '
			print green "$is_a\n"
		else
			print ' is '
			print red "missing\n"
		fi
	done
}

shift
require $@
