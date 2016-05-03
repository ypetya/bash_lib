#!/bin/bash

# this function can source a *.sh relative to the directory of own
function source_relative() {
	get_source_dir "DIR"
	for dependency in $* ; do
		source "$DIR/$dependency.sh"
	done	
}
