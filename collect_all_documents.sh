#!/bin/bash

import is_directory
import find_blacklist

function collect_all_documents() {
	local root_dir=${1? param missing - root_dir}
	if is_directory "$root_dir" ; then

	  files=( $(
		find $root_dir -type f \
		\( -iname \*.docx \
		-o -iname \*.mobi \
		-o -iname \*.doc \
		-o -iname \*.pdf \)\
		$find_blacklist \
		   2>/dev/null
		))

	  for i in ${files[@]} ; do
		cp -v $i .
	  done
	fi
}
