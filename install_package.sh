#!/bin/bash

import is_linux ask_user
# TODO add install instructions for mingw
function install_package() {
	if is_linux ; then
		local prog="${1? param missing - please specify package name}"
		if ask_user "Install $prog?" ; then
			if sudo apt-get install "$prog" ; then return 0 ; fi
		fi
	else
		debug "Do not now how to install $1"
	fi
	return 1
}
