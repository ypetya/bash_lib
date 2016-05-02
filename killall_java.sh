#!/bin/bash

function killall_java() {
  if [ ! $( type -t jps ) == "file" ] ; then
    echo "jps not found! It is part of the JDK, please setup to the PATH!"
    return 1
  fi
  
  if [ ! $( type -t taskkill) == "file" ] ; then
    echo "taskkill not found!"
    return 1
  fi

  PIDS=( $(jps | cut -d' ' -f1) )
  PIDS=(${PIDS[@]:1})
  for pid in $PIDS; do
    taskkill //f //pid $pid
  done
}
