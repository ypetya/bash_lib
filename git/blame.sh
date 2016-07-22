function git.blame() {
	local file_name=${1? param missing - file_name}
	local line
	local commit
	git blame "$file_name" -e -w | while read line ; do
		commit="$(echo $line | cut -d ' ' -f 1)"
		git log "${commit//^}" --pretty=oneline --abbrev-commit -1
		echo "$line" | sed -r 's/^[^\)]+( [0-9]+\).*)$/\1/'
	done
}
