import git.changed
import git.branch_has_upstream
import print.print

function git.pull() {
  if [[ $# == 0 ]] ; then
		if ! git.branch_has_upstream ; then
			print red 'Upstream branch not set!\n'
			return 1
		fi
		if git.changed ; then
			print yellow 'Saving stash...\n'
			git stash
			git pull --stat
			git stash pop
			return $?
		fi
	else
  	git pull "$@"
  fi

	print green 'Done.\n'
  return $?
}

alias pull="git.pull"
