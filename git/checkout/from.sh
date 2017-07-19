import print.print
import git.checkout.branch
import git.branch_list

function git.checkout.from() {
	local source="${1?param missing - source}" branch_pattern="${2?param missing - branch_pattern}"
	print yellow "Trying source $source\n"

	local branches=( $(git.branch_list "$source" "$branch_pattern") )
	if (( ${#branches[@]} == 1 )) ; then
		echo " * found: ${branches[0]}"
		git.checkout.branch "${branches[0]}" ask
		return 0
	elif (( ${#branches[@]} > 1 )) ; then
		echo "There are ${#branches[@]} matching branches:"
		select matching in ${branches[@]} none
		do
			if [ "$matching" == "none" ] ; then
				return 1
			fi
			git.checkout.branch "$matching"
			return 0
		done
	fi
	print red "no match in $source \n"
	return 1
}
