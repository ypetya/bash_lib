import find.blacklist

function file.find_contain() {
	local file_pattern="${1? param missing - file_pattern}"
	local string="${2? param missing - string}"
	find.blacklist . -type f -name "${file_pattern}" -print0 |
	xargs -0 grep "$string" --color
}
