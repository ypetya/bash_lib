import get_source_dir
function remove_shebangs() {
	local dir file
	get_source_dir dir
	for file in $(find . -iname '*.sh') ; do
		sed -i -f "$dir/sed/remove_shebang.sed" "$file"
	done
}
