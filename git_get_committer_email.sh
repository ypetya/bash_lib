#!/bin/bash

function git_get_committer_email() {
	echo $(git config --get user.email || echo $GIT_COMMITTER_EMAIL)
}
