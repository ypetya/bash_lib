function git.tags() {
	git tag -l --sort="version:refname" $@
}

alias tags="git.tags"
