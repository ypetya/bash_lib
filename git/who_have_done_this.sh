#!/bin/bash

import grep_git list_counts_desc timer

function git.who_have_done_this() {
	timer
	grep_git $@ | cut -d ' ' -f 2 | list_counts_desc
	timer_stop
}
