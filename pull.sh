#!/bin/bash

import git.changed

function pull() {
  if [[ $# == 0 ]] ; then
	if git.changed ; then
		git stash
		git pull
		git stash pop
		return $?
	fi
  fi
  shift
  git pull "$@"
  return $?
}
