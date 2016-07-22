import print.debug
function file.get_directory() {
	local file="${1? param missing - file}"
	local out=${2? param missing - output_var}
	local local_dir="${file%/*}"
	debug "$file -> directory: $local_dir"
	export $out="$local_dir"
}
