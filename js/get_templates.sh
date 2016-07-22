import file.list_imports

function js.get_templates() {
	local file="${1?param missing - file}"
	file.list_imports "$file" | sed -rn "s/^text!(.*)$/\1/p"
}
