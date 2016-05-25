#!/bin/bash

function get_file_extension() {
	local file=${1? param missing - file}
	local out=${2? param missing - output_var}
	local local_ext="${file##*.}"
	debug "ext: $local_ext"
	export $out="$local_ext"
}
