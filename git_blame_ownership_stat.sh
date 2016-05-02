#!/bin/bash

source_relative git_what_have_they_done

function git_blame_ownership_stat() {
	for file in $(git ls) ; do 
		git_what_have_they_done $file
	done
}

