#!/bin/bash

import print.debug
function file.get_extension() {
	local file=${1? param missing - file}
	local out=${2? param missing - output_var}
	local local_ext="${file##*.}"
	debug "$file -> extension: $local_ext"
	export $out="$local_ext"
}
