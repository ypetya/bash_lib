#!/bin/bash

function convert_package_to_filename() {
	local DIR="${1?param missing - base directory name}"
	local module="${2?param missing - module}"
	
	echo "$DIR/${module//./\/}.sh"
}

