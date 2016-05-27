#!/bin/bash

import is_variable

function is_defined() {
	local thing="${1?param missing - name}"
	local is_a=$(type -t "$thing")
	if [ -z "$is_a" ] && ! is_variable $thing ; then
		return 1
	fi
}
