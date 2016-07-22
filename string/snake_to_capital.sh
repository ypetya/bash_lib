function string.snake_to_capital() {
	local snake="${1? param missing - snake case}"
	snake="${snake//-/_}"
	echo "${snake^^}"
}
