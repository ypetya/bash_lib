import git.changed
import user.ask
import print.print

function git.checkout_branch() {
	local matching="${1? param missing - branch}"
	local changed=0
	if git.changed &&
		ask_user 'You have local changes. Do you want to continue?'
	then
		# if stash contained changes, set changed=1
		[ "$(git stash | wc -l )" == "1" ] || changed=1
	else
		return 1
	fi
	if [ "${matching:0:15}" == 'remotes/origin/' ] ; then
		print yellow 'Creating local branch for remote branch...\n'
		git checkout $matching -b "${matching:15}" --track
		#	--set-upstream-to="${matching:8}"
	else
		print yellow 'Checking out local branch...\n'
		git checkout $matching
		git pull --stat
	fi

	if [[ $changed == 1 ]] ; then
		git stash pop
	fi
}
