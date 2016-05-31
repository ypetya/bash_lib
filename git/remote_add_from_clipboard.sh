#!/bin/bash

import require_package

if require_package xclip git ; then

	# adds a new remote, git url is grabbed from clipboard
	function git.remote_add_from_clipboard() {
	  local remote
	  remote="$1"
	  if [ -z $remote ] ; then
		read -rp 'Enter remote name :' remote
	  fi
	  GIT_REPO=$(xclip -sel clip -o)
	  git remote add $remote ${GIT_REPO#git clone } $DIR
	}
fi

