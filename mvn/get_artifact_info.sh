#!/bin/bash

import file.is_file
import xml.read
import file.walk_up

function mvn.get_artifact_info() {
	require_package mvn
	local tag
	local content
	local depth=0
	local ref_depth=-2

	local dir=''
	if ! is_file pom.xml ; then
		dir="$(walk_up pom.xml)"
		pushd $dir >> /dev/null
	fi

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

	if (( ${#dir} > 0 )) ; then
		popd >> /dev/null
	fi
}
