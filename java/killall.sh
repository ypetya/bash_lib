#!/bin/bash

import require_package

if require_package jps taskkill ; then
	function java.killall() {
	  unset PIDS
	  local PIDS=( $(jps | cut -d' ' -f1) )
	  PIDS=(${PIDS[@]:1})
	  for pid in $PIDS; do
		taskkill //f //pid $pid
	  done
	}
fi
