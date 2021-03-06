import grep.blacklist
import user.ask
import user.config.load

function idea.open_matching() {
	local pattern="${1?param missing -pattern to find for edit}"
	user.config.load
	search "$pattern"
	print 'Total matches '
	print yellow "$(grep.blacklist -r "$pattern" | wc -l)"
	print ' in '
	print yellow  "$(grep.blacklist -rl "$pattern" | wc -l)"
	print ' files\n'
	for file in $(grep.blacklist -rl "$pattern" ) ; do
		if user.ask "Do you want to edit $file?" ; then
			eval "$idea_exe $file"
		fi
	done
}
