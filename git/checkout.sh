import print.print
import git.fetch
import git.checkout.from

function git.checkout() {
	local branch_pattern="${1?param missing - branch_pattern}"
	local matching

	print 'git.checkout works on remotes/origin only!\n'
	print yellow 'Please select which branch to checkout?\n'

	git.fetch
	git.checkout.from local "$branch_pattern" || \
	git.checkout.from remote "$branch_pattern" || \
	git.checkout.from tag "$branch_pattern"
}

alias git.co='git.checkout'
