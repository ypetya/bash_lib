
function git.branch_current() {
	git rev-parse --abbrev-ref HEAD
}
