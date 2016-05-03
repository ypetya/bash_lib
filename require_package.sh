#!/bin/bash

source_relative install_package
# check for existing tools
# require_package npm git curl ssh
function require_package() {
  while (( $#  > 0 )) ; do
	if ! type -t $1 2>&1 >> /dev/null ; then
  	  echo "$1 is not installed!"
	  install_package "$1" || return 1
    fi
	shift
  done
}
