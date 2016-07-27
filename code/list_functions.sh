function code.list_functions() {
	declare -F | cut -d ' ' -f 3
}

alias list_functions='code.list_functions'
