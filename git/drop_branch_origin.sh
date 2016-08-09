import user.ask

function git.drop_branch_origin() {
	local branch="${1? param missing - branch}"
	local FORCE="$2"
	if [ "$FORCE" == 'force' ] ||
		ask_user "Do you want to delete remote branch : $branch"
	then
		print red "$branch - deleting\n"
		git push origin :$branch
	else
		print yellow "$branch - skipping delete\n"
	fi
}
