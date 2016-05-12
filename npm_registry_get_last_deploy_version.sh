#!/bin/bash

import error is_file
function npm_registry_get_last_deploy_version() {
	
	require_package npm curl
	
	if ! is_file package.json ; then
		error 'There is no package.json in the current directory'
		return 1
	fi
	
	local registry_url=$(npm config get registry)
	local artifact_name=$(grep name package.json | tr -d ' ' | sed -r 's/"name":"|",//g')
	
	curl -sL "$registry_url/$artifact_name" | sed -r 's/.*"version":"([^"]+)".*/\1/'
}
