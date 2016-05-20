#!/bin/bash

function status() {
	# untracked-files=no
	git status -uno "$@"
}
