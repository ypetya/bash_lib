import git.changed

function git.pull() {
  if [[ $# == 0 ]] ; then
	if git.changed ; then
		git stash
		git pull --stat
		git stash pop
		return $?
	fi
  fi
  shift
  git pull "$@"
  return $?
}

alias pull="git.pull"
