import file.walk_up

function npm.remove_locks() {
	local files=( $( find.blacklist . -type f -iname "package-lock.json" ) )

	for file in ${files[@]} ; do
		rm -v "$file"
	done
}
