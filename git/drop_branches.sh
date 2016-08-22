import print.print
import git.branch_list

function git.drop_branches() {
	local FORCE="$1"

	if [[ ! "$FORCE" == 'force' ]] ; then
	  print "first parameter should be 'force' for take action -"
	  print " otherwise it will run bulk only\n"
	fi

	for branch in $( git.branch_list local ) ; do
		case $branch in
			master|develop)
				print green "$branch\n"
			;;
			*)
				print red "$branch\n"
				[ "$FORCE" == 'force' ] && git branch -d $branch
			;;
		esac
	done
}
