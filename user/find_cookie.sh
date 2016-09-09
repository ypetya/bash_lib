import user.config.load
function user.find_cookie(){
	local pattern="${1?param missing - pattern}"
	user.config.load
	# -r recurse
	# -h no filename
	# -A 1 +1 lines
	local res=($(eval grep -r -h -A 1 $pattern '${cookies_path?missing}/*.txt'))
	# format output
	for idx in $( seq 0 3 "${#res[@]}" ) ; do
		echo "${res[$idx]}=${res[$idx+1]}"
	done
}
alias find_cookie='user.find_cookie'
