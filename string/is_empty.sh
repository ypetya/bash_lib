#!/bin/bash

function string.is_empty() {
	local string="${1?param missing - string}"
	if [[ ${#string} > 0 ]] ; then
		return 1
	fi
}
