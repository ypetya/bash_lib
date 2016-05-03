#!/bin/bash

if require_package dpkg ; then

function is_installed() {
  local installed=$(dpkg -s "$1" 2>&1 | grep 'install ok installed')
  if [ "" == "$installed" ] ; then
    return 1
  fi  
  return 0
}

fi
