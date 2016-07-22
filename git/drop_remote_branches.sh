import print.print
function git.drop_remote_branches() {
	FORCE="$1"
	REMOTE_BRANCHES=$(git remote show origin | \
	 grep 'tracked' | \
	 sed 's/tracked//g' | \
	 tr -d ' ')

	if [ "$FORCE" = "" ] ; then
	  print "add a parameter to force deleting -"
	  print " otherwise it will run bulk only\n"
	fi

	for branch in ${REMOTE_BRANCHES[*]} ; do
	  case $branch in
		master|dev)
		  print green "$branch - not deleting\n"
		  ;;
		*)
		  print red "$branch - deleting\n"
		  if [ "$FORCE" != "" ] ; then
			git push origin :$branch
		  fi
		  ;;
	  esac
	done

	echo "Done."
}
