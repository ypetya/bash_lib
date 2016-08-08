import print.print
import git.drop_branch_origin
function git.drop_remote_branches() {
	local FORCE="$1"
	# TODO use git branch --list -r instead! or make prune as well
	local REMOTE_BRANCHES=$(git remote show origin | \
	 grep 'tracked' | \
	 sed 's/tracked//g' | \
	 tr -d ' ')

	if [[ ! "$FORCE" == 'force' ]] ; then
	  print "first parameter should be 'force' for take action -"
	  print " otherwise it will run bulk only\n"
	fi

	for branch in ${REMOTE_BRANCHES[*]} ; do
	  case $branch in
		master|dev)
		  print green "$branch - not deleting\n"
		  ;;
		*)
			git.drop_branch_origin "$branch" "$FORCE"
		  ;;
	  esac
	done

	echo "Done."
}
