import git.get_matching_branches
import git.checkout_branch
import print.print

function git.checkout() {
	set -f
	local branch_pattern="${1?param missing - branch_pattern}"
	local matching

	print 'git.checkout works on remotes/origin only!\n'
	print yellow 'Please select which branch to checkout?\n'
	# TODO do not list remotes where a local branch exists!
	# TODO try to find tags, where no local nor remote branch exists
	local branches=( $(git.get_matching_branches "$branch_pattern") )
	if (( ${#branches[@]} == 1 )) ; then
		echo "Checking out ${branches[0]}.."
		git.checkout_branch "${branches[0]}"
	else
		echo "There are ${#branches[@]} matching branches:"
		select matching in ${branches[@]}
		do
			git.checkout_branch "$matching"
			break
		done
	fi

	set +f
	return 0
}

alias git.co='git.checkout'
