#!/bin/bash

import print error is_variable

function timer() {
	TIMER_START="$(date +%s)"
	trap "timer_on_exit" EXIT
}

function timer_on_exit {
	local END="$(date +%s)"
	local DIFF;
	let DIFF="$END - $TIMER_START"
	print ' * Done in '
	print yellow "$DIFF"
	print " seconds\n"
}

function timer_stop() {
	if is_variable TIMER_START ; then
		timer_on_exit
	else
		error "Timer should be started!"
	fi
}
