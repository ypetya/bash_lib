#!/bin/bash

import is_file error

function npm.get_artifact_name() {
	require_package npm

	if ! is_file package.json ; then
		error 'There is no package.json in the current directory'
		return 1
	fi

	grep name package.json | tr -d ' ' | sed -r 's/"name":"|",//g'
}
