import print.print print.debug
import first
import timer
import get_source_dir
import file.contains
import code.find_duplicate_imports
import code.find_unused_imports
import git.get_committer_email
import git.get_changes_number
import convert_filename_to_package
import file.fix_trailing_spaces

# TODO : explode this fn, as it got too large
# This helper is about to ensure rules in this library
function lib.dev_test() {
	timer
	local dir
	get_source_dir dir
	pushd $dir >> /dev/null
	local fn_name
	local module_name
	local line_width
	local is_error=0
	local width_limit=80
	# 1. ensure files have the same name function or export!
	for file in $( find . -iname '*.sh' ) ; do
		file="${file#./*}"
		module_name="$(convert_filename_to_package . $file)"
		fn_name="function $module_name"
		debug "* file.contains \"$fn_name\" $file"
		if ! file.contains "$fn_name" "$file" ; then
			debug ' * no'
			fn_name="export $module_name"
			debug "* file.contains $fn_name $file"
			if ! file.contains "$fn_name" "$file" ; then
				debug ' * no'
				error "$file does not have $fn_name"
				is_error=1
			fi
		fi
		# 2. no wide lines
		# - corrects tab to 4 spaces
		line_width=$(
			sed -r 's/\t/    /g;s/http.*//g' "$file" | \
			wc -L | cut -d ' ' -f 1 )
		if (( $line_width > $width_limit )) ; then
			print yellow "$file"
			print " is too wide, more than "
			print yellow "$width_limit"
			print " chars! Actual max_length: "
			print red "$line_width\n"
			is_error=1
		fi
		# 3. no trailing spaces
		file.fix_trailing_spaces "$file"
		# 4. first line is shebang
		fn_name="$( first 1 $file )"
		if [ "$fn_name" == '#!/bin/bash' ] ; then
			debug "first line : $fn_name"
			error "hashbang in $file!"
			is_error=1
		fi
	done
	find_duplicate_imports
	find_unused_imports
	# print out notes
	grep -rnE '#[ ]?(FIXME|TODO)' "$dir" --exclude="bash_lib_dev_test.sh" \
		--exclude="./git/*"

	if [ "$is_error" == "0" ] ; then
		print green "All is green.\n"
	fi
	timer_stop

	print "Committer email : "
	print yellow "$(git.get_committer_email)\n"

	if (( $(git.get_changes_number) > 0 )) && user.ask \
		'Would you like to run git-gui?' ; then
		git gui
	fi
	popd >> /dev/null
}
