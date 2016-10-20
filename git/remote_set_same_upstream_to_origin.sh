import git.branch_current

function git.remote_set_same_upstream_to_origin() {
	local current="$(git.branch_current)"
	eval git branch --set-upstream-to=origin/$current $current
}
