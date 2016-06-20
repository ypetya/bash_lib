#!/bin/bash

import npm.get_dev_dependencies
import npm.project.get_artifact_name

function npm.project.get_dev_dependencies() {
	local artifact="$(npm.project.get_artifact_name)"

	npm.get_dev_dependencies $artifact
}
