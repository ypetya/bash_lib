#!/bin/bash

import git.grep list_counts_desc timer git.changed

function git.who_have_done_this() {
	if git.changed ; then
		error 'Please commit your changes'
		return 1
	  fi
	timer
	git.grep $@ | cut -d ' ' -f 2 | list_counts_desc
	timer_stop
}
