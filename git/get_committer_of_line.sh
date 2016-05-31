#!/bin/bash

import git.get_committers_of_file

function git.get_committer_of_line() {
	local file_name=${1? param missing - file_name}
	local line_number=${2? param missing - line_number}

	git.get_committers_of_file "$file_name" | \
		sed -n "${line_number}p"
}
