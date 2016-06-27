#!/bin/bash

function git.stash_list() {
	git stash list | sed -r 's/^[^:]+: (.*)$/\1/'
}
