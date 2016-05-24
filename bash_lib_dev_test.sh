#!/bin/bash

import get_source_dir
import file_contains

# This helper is about to ensure rules in this library
function bash_lib_dev_test() {
	local dir
	get_source_dir dir
	local fn_name
	local line_width
	local is_error=0
	# 1. ensure files have the same name function or export!
	for file in $( find . -maxdepth 1 -iname '*.sh' ) ; do
		fn_name="function ${file%%*.sh}"
		if ! file_contains "$fn_name" "$file" ; then
			fn_name="export ${file%%*.sh}"
			if ! file_contains "$fn_name" "$file" ; then
				error "$file does not have $fn_name"
				is_error=1
			fi
		fi
		# 2. no wide lines
		line_width=$(wc -L $file | cut -d ' ' -f 1)
		if (( $line_width > 80 )) ; then
			print yellow "$file is too wide, more than 80 chars! : $line_width\n"
			is_error=1
		fi
		# TODO 3. no trailing spaces
		if file_contains "\s$" $file ; then
			is_error=1
			print yellow "$file contains trailing space:"
			# sed -nr "/[[:space:]]$/p" $file
			sed -i -r "s/[[:space:]]+$//" $file
			print green "fixing.\n"
		fi
	done

	if [ "$is_error" == "0" ] ; then
		print green "All is green.\n"
	fi
}
