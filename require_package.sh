import print.debug
import is_defined
import install_package
# check for existing tools like the following:
#
# $ require_package npm git curl ssh
#
function require_package() {
  while (( $#  > 0 )) ; do
	if ! is_defined "$1" ; then
  	  debug "$1 is not installed!"
	  install_package "$1" || return 1
	fi
	shift
  done
}
