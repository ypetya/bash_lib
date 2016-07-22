function string.match() {
	local string="${1?param missing - string}"
	local pattern="${2?param missing - pattern}"
	local string2="${string//$pattern}"

	# if string did not change when removed matching pattern,
	# means : no match
	if [[ ${#string} == ${#string2} ]] ; then
		return 1
	fi
	# else match
}
