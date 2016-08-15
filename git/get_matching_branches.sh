function git.get_matching_branches() {
	local branch_pattern="*${1?param missing - branch_pattern}*"
	git branch \
		--list -a --no-color \
		--sort='-creatordate' \
		"$branch_pattern" | tr -d '* '
}
