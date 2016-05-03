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
	source "$DIR/source_relative.sh"
}

init
# assume require_package is available in all environments
source_relative require_package

# require all the parameters
function require() {
	for param_in in "$@" ; do
		local param="${param_in%%.sh}"
		source_relative "$param"
		local is_a=$(type -t "$param")
		if [ ! -z "$is_a" ] ; then
			echo -e "\e[33m$param\e[0m required : \e[32m$is_a\e[0m"
		else
			echo -e "\e[33m$param\e[0m required : \e[31mis missing\e[0m"
		fi
	done
}

shift
require $@
