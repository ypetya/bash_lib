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

# assume following modules are available for all
import require_package is_variable debug print error

# require all the parameters
function require() {
	for param_in in "$@" ; do
		local param="${param_in%%.sh}"
		local fn_name="${param#*/}"
		import "$param"
		local is_a=$(type -t "$fn_name")
		print yellow "$fn_name"
		if [ ! -z "$is_a" ] ; then
			print ' is a '
			print green "$is_a\n"
			#export -f "$fn_name"
		elif is_variable $fn_name ; then
			print ' is a '
			print green "variable\n"
		else
			print ' is '
			print red "missing\n"
		fi
	done
}

[[ "$BASH_SOURCE" == "$0" ]] && require "${@:1}"
