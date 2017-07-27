function is_mac() {
		if [ "$(uname)" == 'Darwin' ] ; then
			return 0
		fi
		return 1
}