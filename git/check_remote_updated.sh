#!/bin/bash

import print.debug
function git.check_remote_updated() {
	local remote_url="${1? param missing - remote_url}"

	local remote_sha1="$(git ls-remote "$remote_url" | grep HEAD | cut -f 1)"
	debug "remote is : $remote_sha1"
	local local_sha1="$(git log -1 --pretty=format:"%H")"
	debug "origin is : $local_sha1"

	if [ "$remote_sha1" == "$local_sha1" ] ; then
		return 1
	fi
}
