#!/bin/bash

import tags first

function git_get_last_tag() {
	# you can apply more sort=<key> clauses for git tag
	# the last one gets to be the primary key, or overrides the prev.
	tags --sort="-version:refname" | first
}
