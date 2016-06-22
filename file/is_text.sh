#!/bin/bash

import file.get_type

function file.is_text() {
	local FILE_TYPE=$(file.get_type "$1" | grep text)

	if [ "$FILE_TYPE" == "" ] ; then
		return 1
	fi
}
