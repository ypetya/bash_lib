import user.ask
import print.print

function git.checkout.branch() {
	local branch_name="${1? param missing - branch_name}"
	local ask="$2"
	local changed=0
	local local_branch

	print yellow "Going to check out branch or tag : "
	print green "$branch_name\n"
	if [ "$ask" == "ask" ] ; then
		if ! user.ask 'Do you proceed?' ; then
			return 1
		fi
	fi
	# auto stashing
	[ "$(git stash | wc -l )" == "1" ] || changed=1

	if [ "${branch_name:0:7}" == 'origin/' ] ; then
		# checkout remote branch
		local_branch="${branch_name:7}"
		print yellow 'Creating local tracking branch for remote branch : '
		print green "$local_branch\n"
		# checkout branch
		git checkout $branch_name -b "$local_branch" --track
		# set upstream
		git branch --set-upstream-to=$branch_name $local_branch
	else
		git checkout $branch_name
		git pull --stat
	fi

	if [[ $changed == 1 ]] ; then
		git stash pop
	fi
}
