#!/bin/bash

# This file is the initial entry point of the bash_lib
# every script can individually source by using the require function
# or loading this lib first
#
# $ require fav killall_java git_helpers


# require source_relative - which can be used by any local script
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/source_relative.sh"

# require all the parameters
function require() {
	for param_in in "$@" ; do
		local param="${param_in%%.sh}"
		source_relative "$param"
		local is_a=$(type -t "$param")
		echo -e "\e[33m$param\e[0m required : \e[32m$is_a\e[0m"
	done
}

shift
require $@
