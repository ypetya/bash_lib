#!/bin/bash

import file.walk_up
import is_file

function npm.get_artifact_name() {
	require_package npm
	local dir=''
	if ! is_file package.json ; then
		dir="$(walk_up package.json)"
		pushd $dir >> /dev/null
	fi

	grep name package.json | tr -d ' ' | sed -r 's/"name":"|",//g'

	if (( ${#dir} > 0 )) ; then
		popd >> /dev/null
	fi
}
