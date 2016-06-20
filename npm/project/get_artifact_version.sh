#!/bin/bash

import npm.project.get_artifact_name
import npm.get_artifact_version

function npm.project.get_artifact_version() {
	local artifact_name=$(npm.project.get_artifact_name)
	if [[ $? == 0 ]] ; then
		npm.get_artifact_version "$artifact_name"
	fi
}
