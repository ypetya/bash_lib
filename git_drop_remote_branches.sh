#!/bin/bash

function git_drop_remote_branches() {
	FORCE="$1"
	REMOTE_BRANCHES=$(git remote show origin | grep 'tracked' | sed 's/tracked//g' | tr -d ' ')

	if [ "$FORCE" = "" ] ; then
	  echo "add a parameter to force deleting - else it will run bulk only"
	fi

	for branch in ${REMOTE_BRANCHES[*]} ; do
	  case $branch in
		master|dev)
		  echo "$branch - not deleting"
		  ;;
		*)
		  echo "$branch - deleting"
		  if [ "$FORCE" != "" ] ; then
			git push origin :$branch
		  fi
		  ;;
	  esac
	done

	echo "Done."
}
