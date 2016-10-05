import git.branch_list
import git.checkout_branch
import print.print
import git.fetch

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

function git.checkout.from() {
	local source="$1" branch_pattern="$2"
	print yellow "Trying source $source\n"

	local branches=( $(git.branch_list "$source" "$branch_pattern") )
	if (( ${#branches[@]} == 1 )) ; then
		echo "Going to checkout: ${branches[0]}"
		git.checkout_branch "${branches[0]}" ask
		return 0
	elif (( ${#branches[@]} > 1 )) ; then
		echo "There are ${#branches[@]} matching branches:"
		select matching in ${branches[@]} none
		do
			if [ "$matching" == "none" ] ; then
				return 1
			fi
			git.checkout_branch "$matching"
			return 0
		done
	fi
	print red "no match in $source \n"
	return 1
}
