#!/bin/bash

import ask_user

function rename_in_files() {
	local pattern_from="${1? param missing - pattern_from}"
	local pattern_to="${2? param missing - pattern_to}"
	local files=( $( grep -rl "$pattern_from" . --exclude ".git/*") )

	grep -rnH "$pattern_from" . --exclude ".git/*"
	if ask_user 'Do you really want to rename these?' ; then
		debug 'sed pattern : s/'$pattern_from'/'$pattern_to'/g'
		for file in ${files[@]} ; do
			debug "replaceing in $file"
			sed -ri 's/'$pattern_from'/'$pattern_to'/g' "$file"
		done
	fi
	print green Done
}
