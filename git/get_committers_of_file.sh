#!/bin/bash

import sed.git_extract_commiter

function git.get_committers_of_file() {
	local file_name=${1? param missing - file_name}

	git blame "$file_name" -e -w | \
		sed -r "$sed.git_extract_commiter"
}
