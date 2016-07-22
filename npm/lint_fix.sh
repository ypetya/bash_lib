import print
import require_package
import timer
import file.walk_up

function npm.lint_fix () {
	require_package npm grunt
	timer
	local dir="$(walk_up package.json)"
	pushd $dir >> /dev/null

	if ! grunt eslint:dev ; then
		error ' * eslint failed, executing eslint fix'
		npm run eslint-fix
		print yellow " * automatic fixes have been applied\n"
		if grunt eslint:dev ; then
			print green " * ok\n"
		else
			error " * there is still an error, could not resolve.\n"
			timer_stop
			return 1
		fi
	fi

	popd >> /dev/null

	timer_stop
}

alias lint_fix='npm.lint_fix'
