function get_random() {
	local range="${1?param missing - range}"
	local num
	let num="$RANDOM % $range"
	echo $num
}
