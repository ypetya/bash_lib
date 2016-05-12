#!/bin/bash

function npm_is_version_used() {
	require_package npm
	
	local has_version="$(npm show | grep ${1? param missing - please enter version string} | wc -l)"
	
	if [ "$has_version" == "0" ] ; then
		return 1
	fi
}
