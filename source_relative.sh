#!/bin/bash

# this function can source a $1.sh relative to the directory of own
function source_relative() {
	local DIR="${BASH_SOURCE%/*}"
	if [[ ! -d "$DIR" ]]; then
		DIR="$PWD"
	fi
	for dependency in $* ; do
		source "$DIR/$dependency.sh"
	done	
}
