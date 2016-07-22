function file.get_type() {
	file -b ${1? param missing - enter filename}
}
