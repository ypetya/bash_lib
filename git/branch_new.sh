function git.branch_new() {
	local branch_name="${1?param missing : new branch name from HEAD}"
	git checkout -b $branch_name
}
