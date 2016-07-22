import print.print print.debug
import file.list_import_vars
import find.blacklist
import timer

# TODO use file.for_each
function find_unused_imports() {
	timer
	local files=( $( find.blacklist . -type f ) )
	local imports
	local count
	declare -i count
	for file in ${files[@]} ; do
		imports=( $( file.list_import_vars $file ) )

		for i in ${imports[@]} ; do
			debug "$file import $i"
			count=$( grep -c "${i}" "$file" )
			debug " has $count occurences"
			if (( $count == 1 )) ; then
				print "$file has an unused import : "
				print red "$i\n"
			fi
		done
	done
	timer_stop
}
