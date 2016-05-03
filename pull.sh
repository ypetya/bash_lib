#!/bin/bash

source_relative git_changed

function pull() {
  if [[ $# == 0 ]] ; then
	if git_changed ; then
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
