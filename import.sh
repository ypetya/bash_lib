#!/bin/bash

# this function can source a *.sh relative to the directory of own
# it will skip loaded packages
# you can force to load anyway, by passing -f as the first parameter
function import() {
	local force=0
	if (( $# > 1 )) && [[ "$1" == '-f' ]] ; then
		force=1
		shift
	fi
	get_source_dir "DIR"
	for dependency in $@ ; do
		if [[ "$force" == "1" ]] || ! is_defined "$dependency" ; then
			debug "sourceing : $DIR/$dependency.sh"
			source "$DIR/$dependency.sh"
		fi
	done
}


function debug() {
  [[ "$DEBUG" == "1" ]] && echo "$@" 1>&2
}

import -f is_defined
import -f debug

