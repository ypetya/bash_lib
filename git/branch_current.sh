
function git.branch_current() {
	git branch | grep \* | cut -d ' ' -f2
}
