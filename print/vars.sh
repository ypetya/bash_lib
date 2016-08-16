function print.vars() {

	for var in $@ ; do
		eval echo "$var"="\$$var"
	done
}
