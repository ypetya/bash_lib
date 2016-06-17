#!/bin/bash

function npm.get_artifact_version() {
	local artifact_name="${1? param missing - artifact name}"
	npm show "$artifact_name" version | first
}
