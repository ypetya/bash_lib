import list
import get_source_dir

# makes a soft reload by default to make inital loading faster
# parameter -f forces reload
function lib.reload() {
	local dir things

	get_source_dir dir

	things=($(list))

	if (( $# > 1 )) && [[ "$1" == '-f' ]] ; then
		shift
		import -f "${things[@]}"
	else
		import "${things[@]}"
	fi
}
