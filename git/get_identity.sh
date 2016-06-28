#!/bin/bash

import print.print
function git.get_identity() {
	print yellow 'Author name:'
	if is_variable GIT_AUTHOR_NAME ; then
		echo "$GIT_AUTHOR_NAME"
	else
		git config --get author.name || echo "-"
	fi
	print yellow 'Author email:'
	if is_variable GIT_AUTHOR_EMAIL ; then
		echo "$GIT_AUTHOR_EMAIL"
	else
		git config --get author.email || echo "-"
	fi
	print yellow 'Commiter name:'
	if is_variable GIT_COMMITTER_NAME ; then
		echo "$GIT_COMMITTER_NAME"
	else
		git config --get user.name || echo "-"
	fi
	print yellow 'Committer email:'
	if is_variable GIT_COMMITTER_EMAIL ; then
		echo "$GIT_COMMITTER_EMAIL"
	else
		git config --get user.email || echo "-"
	fi
}
