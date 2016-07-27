import file.is_file

function git.is_file_in_repo() {
	if is_file "$1" ; then
		if (( $(git ls -- "$1" | wc -l ) > 0 )) ; then
			return 0
		fi
	fi
	return 1
}
