import print.print
import string.match_regex

function array_find() {
	local arr_name=${1? param missing - array name}[@]
	local pattern=${2? param missing - pattern }
	local arr=("${!arr_name}")

	for item in ${arr[@]} ; do
		if string.match_regex "$item" "$pattern" ; then
			print "$item\n"
		fi
	done
}
