import require_package

function npm.require_global() {
	require_package npm
	if ! npm list "$1" 2>&1 > /dev/null ; then
		npm install "$1" -g
	fi
}
