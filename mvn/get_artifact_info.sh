#!/bin/bash

import is_file print.error
import xml.read

function mvn.get_artifact_info() {
	require_package mvn

	if ! is_file pom.xml ; then
		error 'There is no pom.xml in the current directory'
		return 1
	fi
	local tag
	local content
	local depth
	local ref_depth
	ref_depth=-2
	depth=0
	cat pom.xml | while xml.read 'tag' 'content' ; do

		if [[ "${tag:0:7}" == 'project' ]] ; then
			let ref_depth=$depth+1
		fi

		debug "$depth $tag : ""'""${content%%* }""'"

		if (( $depth == $ref_depth )) ; then
			echo "$depth $tag : ""'""${content%%* }""'"
		fi

		if [[ "${tag:0:1}" == '/' ]] ; then
			let depth=$depth-1
		else
			let depth=$depth+1
		fi
	done
}
