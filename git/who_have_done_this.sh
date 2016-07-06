#!/bin/bash

import git.grep list_counts_desc timer
import git.ensure_clean

function git.who_have_done_this() {
	if git.ensure_clean ; then
		timer
		git.grep $@ | cut -d ' ' -f 2 | list_counts_desc
		timer_stop
	fi
}
