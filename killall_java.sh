#!/bin/bash

import require_package

require_package jps taskkill || ( error "missing dependency!" && return 1 )

function killall_java() {
  unset PIDS
  local PIDS=( $(jps | cut -d' ' -f1) )
  PIDS=(${PIDS[@]:1})
  for pid in $PIDS; do
    taskkill //f //pid $pid
  done
}
