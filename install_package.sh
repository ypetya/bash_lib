import print.debug
import is_linux user.ask

AUTO_INSTALL=${AUTO_INSTALL:=0}
function install_package() {
	if is_linux && [ "$AUTO_INSTALL" == "1" ]; then
		local prog="${1? param missing - please specify package name}"
		if user.ask "Install $prog?" ; then
			if sudo apt-get install "$prog" ; then return 0 ; fi
		fi
	else
		debug "Do not now how to install $1"
	fi
	return 1
}
