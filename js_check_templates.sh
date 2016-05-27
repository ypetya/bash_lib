#!/bin/bash

import debug
import js_get_templates
import is_file
import get_file_directory

function js_check_templates() {
	local file="${1? param missing - file}"
	local templates="$(js_get_templates $file)"
	local path_base="$(get_file_directory $file)"
	local join_path

	for template in $templates ; do
		join_path="$path_base/$template"
		debug "Checking $join_path"
		if ! is_file "$join_path" ; then
			error "Template not exists : $file : $template"
		fi
	done
}
