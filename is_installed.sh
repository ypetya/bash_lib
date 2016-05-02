#!/bin/bash

function is_installed() {
  local installed=$(dpkg -s "$1" 2>&1 | grep 'install ok installed')
  if [ "" == "$installed" ] ; then
    return 1
  fi  
  return 0
}
