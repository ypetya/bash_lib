function git.status() {
	# untracked-files=no
	git status -uno "$@"
}

alias status='git.status'
