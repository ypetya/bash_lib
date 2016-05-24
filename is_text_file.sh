#!/bin/bash

import get_file_type

function is_text_file() {
	local FILE_TYPE=$(get_file_type "$1" | grep text)

	if [ "$FILE_TYPE" == "" ] ; then
		return 1
	fi
}
