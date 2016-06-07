#!/bin/bash

import require_package
import npm.get_artifact_name first

function npm.registry_get_last_deploy_version() {
	require_package npm
	local artifact_name=$(npm_get_artifact_name)
	if [[ $? == 0 ]] ; then
		npm show "$artifact_name" version | first
	fi
}
