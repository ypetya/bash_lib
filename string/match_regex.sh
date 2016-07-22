# bash4 : when there is a doublequote, string match takes place
#
function string.match_regex() {
	local string="${1?param missing - string}"
	local regex="${2?param missing - regex}"

	if [[ ! $string =~ $regex ]] ; then
		return 1
	fi
}
