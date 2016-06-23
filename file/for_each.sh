#!/bin/bash

import print.debug
import find.blacklist

# it will call $1 callback with file names passing one-by-one
# makes as many calls as files exists
#
# Example:
# -------
# file.for_each file.get_type
# => will print out all the file types
function file.for_each() {
	local callback="${1?param missing - callback}"
	local files=( $( find.blacklist . -type f ) )

	for file in ${files[@]} ; do
		debug "$callback $file"
		$callback "$file"
	done
}
