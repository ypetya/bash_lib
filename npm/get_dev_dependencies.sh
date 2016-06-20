#!/bin/bash

import npm.get_project_artifact_name

function npm.get_dev_dependencies() {
	local artifact=$(npm.get_project_artifact_name)

	npm view $artifact devDependencies
}
