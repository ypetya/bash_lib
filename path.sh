function path() {
	while (( $# > 0 )) ; do
		export PATH="$PATH:$1"
		shift
	done
	echo $PATH | tr ':' '\n'
}
