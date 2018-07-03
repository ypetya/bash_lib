
import print.info

# require all the parameters
# give back some human readable info on requiring a single dependency
# require will force import to reload (source) the code from disk
function require() {
	for dep in "$@" ; do
		import -f "$dep"
		if [ "$#" == "1" ] ; then
			print.info "$dep"
		fi
	done
}
