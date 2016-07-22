import file.get_type
import print.print print.debug
import string.match_regex
# list files containing specific strings in file-type
# recursing from the current dir
function file.find_by_type() {
	local look_for=${1?param missing - look_for}

	local files="$(find . -type f)"
	local file_type

	for file in $files ; do
		file_type="$(file.get_type $file)"
		debug "$file : $file_type"
		if string.match_regex "$file_type" "$look_for" ; then
			print "$file"
			print " : "
			print yellow "$file_type\n"
		fi
	done
}
