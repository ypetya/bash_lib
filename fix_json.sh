import ask_user
# handy helper fn to fix json formatting:
function fix_json() {
	local file="${1? param missing - file}"
	if ask_user "It will overwrite $file. Are you sure?" ; then
		# 1.: change "'" -> "\""
		sed -ri "s/[']/\"/g" "$file"
		# 2. quoted keys
		sed -ri 's/([a-zA-Z]+):/"\1":/' "$file"
	fi
}
