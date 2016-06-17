#!/bin/bash

import file.walk_up

function npm.get_project_artifact_name() {
	require_package npm
	local dir="$(walk_up package.json)"
	pushd $dir >> /dev/null
	
	grep name package.json | tr -d ' ' | sed -r 's/"name":"|",//g'

	popd >> /dev/null
}
