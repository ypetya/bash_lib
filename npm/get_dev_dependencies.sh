#!/bin/bash

import sed.remove_empty_lines

function npm.get_dev_dependencies() {
	local artifact="${1?param missing - artifact_name}"

	npm view $artifact devDependencies | \
		tr -d "{} '," | \
		sed.remove_empty_lines
}
