#!/bin/bash

# TODO add install instructions for mingw
function install_package() {
	local UNAME="$(uname)"
  
	case $UNAME in
		MINGW*)
			debug "Do not now how to install $1"
			return 1
		  ;;
		Linux)
			sudo apt-get install $1 || return 1
		  ;;
	esac
}
