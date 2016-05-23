#!/bin/bash

import is_variable

function git_get_committer_email() {
	# priority 1.
	if is_variable GIT_COMMITTER_EMAIL ; then
		echo "$GIT_COMMITTER_EMAIL"
	else
		git config --get user.email
	fi
}
