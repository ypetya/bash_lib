import git.ensure_clean
import user.ask
import print.print

function git.checkout_branch() {
	local matching="${1? param missing - branch}"
	local changed=0 local_branch
	if git.ensure_clean ; then
		# TODO fn instead; if stash contained changes, set changed=1
		[ "$(git stash | wc -l )" == "1" ] || changed=1
	else
		return 1
	fi

	if [ "${matching:0:7}" == 'origin/' ] ; then
		local_branch="${matching:7}"
		print yellow 'Creating local tracking branch for remote branch : '
		print green "$local_branch\n"

		git checkout $matching -b "$local_branch" --track
	else
		print yellow "Checking out local branch or tag : $matching\n"
		git checkout $matching
		git pull --stat
	fi

	if [[ $changed == 1 ]] ; then
		git stash pop
	fi
}
