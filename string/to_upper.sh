function string.to_upper() {
	#echo "${string^^}"
	tr '[:lower:]' '[:upper:]'
}
