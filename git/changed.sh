import git.get_changes_number

function git.changed() {
	if [ "$(git.get_changes_number)" == "0" ] ; then
		return 1 # returning false when no change
	fi

	# returning true when changed
}
