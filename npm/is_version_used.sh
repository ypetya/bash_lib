#!/bin/bash

function npm.is_version_used() {
	local version="${1? param missing - please enter version string}"
	local has_version="$(npm show | grep $version | wc -l)"

	if [ "$has_version" == "0" ] ; then
		return 1
	fi
}
