import get_source_dir
function path_dos2unix() {
	local input_path="${1?missing input_path}"
	get_source_dir dir
	echo "$input_path" | sed -r -f $dir/sed/path_dos_to_unix.sed
}
