import java.keystore

# this will import all files in directory
function java.import_certs() {
	print "Certificates to import :"
	for file in * ; do
		print " $file"
	done
	print "\n"
	if ask_user 'Are you sure to import all of these?' ; then
		for file in * ; do
			java.keystore import -f $file -alias $f
		done
	fi
}
