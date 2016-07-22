import ask_user
import print.print print.debug
import grep.blacklist

function rename_in_files() {
	local pattern_from="${1? param missing - pattern_from}"
	local pattern_to="${2? param missing - pattern_to}"
	local files=( $( grep.blacklist -rl "$pattern_from" ) )

	grep.blacklist -rnH "$pattern_from"
	if ask_user 'Do you really want to rename these?' ; then
		debug 'sed pattern : s/'$pattern_from'/'$pattern_to'/g'
		for file in ${files[@]} ; do
			debug "replaceing in $file"
			sed -ri 's/'$pattern_from'/'$pattern_to'/g' "$file"
		done
	fi
	print green Done
}
