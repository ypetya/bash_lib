function git.log_stat() {
	git log --numstat --no-merges -w "$@"
}
