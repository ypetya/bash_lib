#!/bin/bash

# require import - which can be used by any local script
function init() {
	local DIR="${BASH_SOURCE%/*}"
	if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

	for f in get_source_dir convert_package_to_filename ; do
		source "$DIR/$f.sh"
	done
}

# this function can source a *.sh relative to the directory of its own
# lazyload: it will skip loaded packages unless -f is the first parameter
# TODO : directory import
function import() {
	#echo "$@"
	local force=0
	local DIR
	local dependency
	if (( $# > 1 )) && [[ "$1" == '-f' ]] ; then
		force="1"
		shift
	fi
	get_source_dir "DIR"
	for module in $@ ; do
		if [[ "$force" == "1" ]] || ! is_defined "$module" ; then
			dependency="$( convert_package_to_filename "$DIR" "$module" )"
			source "$dependency"
		fi
	done
}

init
import -f is_defined
