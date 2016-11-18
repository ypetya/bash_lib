function path.remove() {
	local removeElement="${1?param missing - removeElement}"
	export PATH="${PATH//$removeElement:};"
}
