import git.changed user.ask print.error

function git.ensure_clean() {
	if git.changed ; then
		if ! user.ask 'You have uncommited changes. Do you want to continue?'
		then
			error 'Please commit your changes'
			return 1
		fi
	fi
}
