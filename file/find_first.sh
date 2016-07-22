function file.find_first() {
	local start_dir="${1? param missing - start_dir}"
	local file_name="${2? param missing - file_name}"
	find $start_dir -iname "$file_name" -type f -print -quit 2> /dev/null
}
