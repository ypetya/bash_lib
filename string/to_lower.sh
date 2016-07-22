function string.to_lower() {
	# echo "${string,,}"
	tr '[:upper:]' '[:lower:]'
}
