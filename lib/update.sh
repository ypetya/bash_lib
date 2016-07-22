import timer
import git.check_remote_updated
import git.pull
import get_source_dir
import print.print
import list

function lib.update() {
	local dir
	timer
	get_source_dir dir
	pushd $dir >> /dev/null
	if git.check_remote_updated origin ; then
		print red "Remote origin has new commits : initiating update\n"
		pull
		import -f "$(list)"
	fi
	popd >> /dev/null
	timer_stop
}
