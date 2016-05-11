#!/bin/bash

# change the separator, default = be '\n'!
function set_separator() {
	local NEW_SEPARATOR=$'\n'
	if [ ! -z "$1" ] ; then
		NEW_SEPARATOR="$1"
	fi
	OLD_IFS=$IFS
	IFS="$NEW_SEPARATOR"
}

function reset_separator() {
	IFS=$OLD_IFS
}
