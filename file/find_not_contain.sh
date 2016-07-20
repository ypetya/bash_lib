#!/bin/bash

import grep.blacklist

function file.find_not_contain() {
	local file_pattern="${1? param missing - file_pattern}"
	local string="${2? param missing - string}"
	grep.blacklist -rL --include='$file_pattern' '$string'
}
