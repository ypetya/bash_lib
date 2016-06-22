#!/bin/bash

import grep.directory_blacklist

function file_find_not_contain() {
	local file_pattern="${1? param missing - file_pattern}"
	local string="${2? param missing - string}"
	grep.directory_blacklist -rL --include='$file_pattern' '$string'
}
