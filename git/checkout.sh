function git.checkout() {
	set -f
	local branch_pattern="*${1?param missing - branch_pattern}*"
	local matching
	local changed=0
	if git.changed &&
		ask_user 'You have local changes. Do you want to continue?'
	then
		changed=1
		git stash
	fi
	print 'git.checkout works on remotes/origin only!\n'
	print yellow 'Please select which branch to checkout?\n'
	select matching in $( git branch \
		--list -a --no-color \
		--sort='-creatordate' \
		"$branch_pattern" | tr -d '* ' )
	do
		if [ "${matching:0:15}" == 'remotes/origin/' ] ; then
			print yellow 'Creating local branch for remote branch...\n'
			git checkout $matching -b "${matching:15}" --track
		else
			print yellow 'Checking out local branch...\n'
			git checkout $matching
			git pull --stat
		fi

		if [[ changed == 1 ]] ; then
			git stash pop
		fi
		set +f
		return 0
	done
}
