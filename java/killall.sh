#!/bin/bash

import require_package

function java.killall() {
	require_package jps taskkill
	unset PIDS
	local PIDS=( $(jps | cut -d' ' -f1) )
	PIDS=(${PIDS[@]:1})
	for pid in $PIDS; do
		taskkill //f //pid $pid
	done
}

