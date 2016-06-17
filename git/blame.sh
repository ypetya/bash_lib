#!/bin/bash

import sed.git_extract_commit

function git.blame() {
	local file_name=${1? param missing - file_name}
	local line
	local commit
	git blame "$file_name" -e -w | while read line ; do
		commit="$(echo $line | cut -d ' ' -f 1)"
		echo "$commit"
		echo "$line"
	done
}
