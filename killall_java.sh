#!/bin/bash

if require_package jps taskkill ; then
	function killall_java() {
	  unset PIDS
	  local PIDS=( $(jps | cut -d' ' -f1) )
	  PIDS=(${PIDS[@]:1})
	  for pid in $PIDS; do
		taskkill //f //pid $pid
	  done
	}
fi
