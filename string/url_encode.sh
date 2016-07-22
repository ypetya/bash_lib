# FIXME url_encode is incomplete : fix this to all characters

function string.url_encode() {
	sed -r 's/[=]/%3D/g'
}
