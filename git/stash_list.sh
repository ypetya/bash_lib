#!/bin/bash

# show up stash content, only the human readable part

function git.stash_list() {
	git stash list | sed -r 's/^[^:]+: (.*)$/\1/'
}
