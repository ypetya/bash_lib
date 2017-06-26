import print.print
import git.branch_list

function git.drop_branches_local_cleanup() {
	local FORCE="$1" FORCE2="$2"

	if [[ ! "$FORCE" == 'force' ]] ; then
	  print "first parameter should be 'force' for take action -"
	  print " otherwise it will run bulk only\n"
	  print "second parameter should be 'force' for drop branch with"
	  print " changes\n"
	fi

	for branch in $( git.branch_list local ) ; do
		case $branch in
			master|develop)
				print green "$branch\n"
			;;
			*)
				print red "$branch\n"
				if [ "$FORCE" == 'force' ] ; then
					if [ "$FORCE2" == 'force' ] ; then
						git branch -D $branch
					else
						git branch -d $branch
					fi
				fi
			;;
		esac
	done
}
