#!/bin/bash

# TODO this is duplicated!
# require import - which can be used by any local script
function init() {
	DIR="${BASH_SOURCE%/*}"
	if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
	source "$DIR/get_source_dir.sh"
	source "$DIR/import.sh"
}
init

import print

function execute() {
	local runnable=$1
	shift
	eval "$runnable $@"
	print green "execute : ok" 
}

[[ "$BASH_SOURCE" == "$0" ]] && execute "${@:1}"
