#!/bin/bash

import print

function timer() {
	TIMER_START="$(date +%s)"
	trap "timer_on_exit" EXIT
}

function timer_on_exit {
	local END="$(date +%s)"
	local DIFF="$( expr $END - $TIMER_START )"
	print ' * Done in '
	print yellow "$DIFF"
	print " seconds\n"
}

function timer_stop() {
	timer_on_exit
}
