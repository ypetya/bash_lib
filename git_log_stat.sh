#!/bin/bash

function git_log_stat() {
	git log --numstat --no-merges -w "$@"
}
