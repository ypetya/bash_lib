#!/bin/bash

import npm.get_project_artifact_name
import npm.get_artifact_version

function npm.get_project_artifact_version() {
	local artifact_name=$(get_project_artifact_name)
	if [[ $? == 0 ]] ; then
		npm.get_artifact_version "$artifact_name"
	fi
}
