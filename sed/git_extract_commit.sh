#!/bin/bash

# TODO : make git grep more clean with having commit messages in it
export sed_git_extract_commit='s/^([^@ ]*?).*?(\(<)([^@]*?)(@.*)/\1:\3/'

function sed.git_extract_commit() {
	sed -r "$sed_git_extract_commit"
}
