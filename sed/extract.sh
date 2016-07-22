function sed.extract() {
	local pattern_name="${1? param missing - variable of pattern}"
	local file=${2? param missing - file}
	local pattern="${!pattern_name}"
	sed -nr "$pattern" "$file"
}
