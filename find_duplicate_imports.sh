import print.print print.debug
import file.list_imports
import find.blacklist
import timer

# TODO use file.for_each
function find_duplicate_imports() {
	timer
	local files=( $( find.blacklist . -type f ) )
	local top_import
	local count
	declare -i count
	for file in ${files[@]} ; do
		top_import=$(file.list_imports $file | list_counts_desc | first )
		debug "$file:$top_import"
		count=$( echo $top_import | cut -d ' ' -f 1)
		debug "top import count : $count"
		if (( $count > 1 )) ; then
			print "$file has "
			print red "$top_import\n"
		fi
	done
	timer_stop
}
