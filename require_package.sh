#!/bin/bash

import install_package
# check for existing tools like the following:
#
# $ require_package npm git curl ssh
#
function require_package() {
  while (( $#  > 0 )) ; do
	if ! type -t $1 2>&1 >> /dev/null ; then
  	  debug "$1 is not installed!"
	  install_package "$1" || return 1
    fi
	shift
  done
}
