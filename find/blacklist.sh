export find_blacklist=' -not \(
		  -path '"'"'*/.git/*'"'"'
		  -o -path '"'"'*/.m2/*'"'"'
		  -o -path '"'"'*/caches/*'"'"'
		  -o -path '"'"'*/coverage/*'"'"'
		  -o -path '"'"'*/dist/*'"'"'
		  -o -path '"'"'*/.idea/*'"'"'
		  -o -path '"'"'*/.sass-cache/*'"'"'
		  -o -path '"'"'*/.svn/*'"'"'
		  -o -path '"'"'*/node_modules/*'"'"'
		  \) '


function find.blacklist() {
	eval find "$@" $find_blacklist
}
