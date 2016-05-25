#!/bin/bash

import grep_directory_blacklist

function find_files_not_contain() {
	local file_pattern="${1? param missing - file_pattern}"
	local string="${2? param missing - string}"
	eval grep -rL $grep_directory_blacklist --include='$file_pattern' '$string'
}
