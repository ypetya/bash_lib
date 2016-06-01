#!/bin/bash

import print.debug
import find_blacklist

# it will call $1 callback with file names passing one-by-one
# makes as many calls as files exists
#
# Example:
# -------
# for_each_file get_file_type
# => will print out all the file types
function for_each_file() {
	local callback="${1?param missing - callback}"
	local files=( $( eval find . -type f $find_blacklist ) )

	for file in ${files[@]} ; do
		debug "$callback $file"
		$callback "$file"
	done
}
