import file.contains
import print.print
import sed.fix_trailing_spaces

function file.fix_trailing_spaces() {
	local file="${1? param missing - file}"
	if file.contains "\s$" $file ; then
		print yellow "$file contains trailing space:"
		sed.fix_trailing_spaces $file
		print green "fixing.\n"
	fi
}
