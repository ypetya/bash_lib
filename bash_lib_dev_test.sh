#!/bin/bash

# TODO : next Steps:
# TODO : 1. should use packages as function names can contain dot character

import first
import get_source_dir
import file_contains
import sed_fix_trailing_spaces

# This helper is about to ensure rules in this library
function bash_lib_dev_test() {
	local dir
	get_source_dir dir
	local fn_name
	local line_width
	local is_error=0
	local width_limit=80
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
		# - corrects tab to 4 spaces
		line_width=$(
			sed -r 's/\t/    /g' "$file" | wc -L | cut -d ' ' -f 1 )
		if (( $line_width > $width_limit )) ; then
			print yellow "$file"
			print " is too wide, more than "
			print yellow "$width_limit"
			print " chars! Actual max_length: "
			print red "$line_width\n"
			is_error=1
		fi
		# 3. no trailing spaces
		if file_contains "\s$" $file ; then
			print yellow "$file contains trailing space:"
			sed_fix_trailing_spaces $file
			print green "fixing.\n"
		fi
		# 4. first line is shebang
		fn_name="$( first 1 $file )"
		if [ ! "$fn_name" == '#!/bin/bash' ] ; then
			debug "first line : $fn_name"
			error "hashbang not valid in $file!"
			is_error=1
		fi
	done
	# 5. print out notes
	grep -rnE 'FIXME|TODO' "$dir" --exclude="bash_lib_dev_test.sh" \
		--exclude="./git/*"

	if [ "$is_error" == "0" ] ; then
		print green "All is green.\n"
	fi
}
