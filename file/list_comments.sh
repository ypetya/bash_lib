import sed.extract_comments
import file.get_extension
import sed.extract

function file.list_comments() {
	local file="${1? param missing - file}"
	local extee
	file.get_extension "$file" extee
	local sed_extract="${sed_extract_comments[$extee]}"
	sed.extract sed_extract $file
}
