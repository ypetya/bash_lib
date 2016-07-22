function git.get_changes_number() {
	git status --porcelain -uno | wc -l
}
