function path.add() {
	local newElement="${1?param missing - newElement}"
	export PATH="$newElement:$PATH"
}
