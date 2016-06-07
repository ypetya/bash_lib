#!/bin/bash

import git.grep list_counts_desc timer

function git.who_have_done_this() {
	timer
	git.grep $@ | cut -d ' ' -f 2 | list_counts_desc
	timer_stop
}
