import print.print
import git.drop_remote_branch_at_origin
import git.branch_list

function git.drop_branches_remote_cleanup() {
	local FORCE="$1"
	local REMOTE_BRANCHES=$(git.branch_list remote |
	sed -r s,origin/,,g )

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
			print red "$branch\n"
			[ "$FORCE" == 'force' ] && \
			git.drop_remote_branch_at_origin "$branch" "$FORCE"
		  ;;
	  esac
	done

	echo "Done."
}
