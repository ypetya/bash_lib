import grep.blacklist
import ask_user
import user.load_config

function idea.open_matching() {
	local pattern="${1?param missing -pattern to find for edit}"
	user.load_config
	search "$pattern"
	print 'Total matches '
	print yellow "$(grep.blacklist -r "$pattern" | wc -l)"
	print ' in '
	print yellow  "$(grep.blacklist -rl "$pattern" | wc -l)"
	print ' files\n'
	for file in $(grep.blacklist -rl "$pattern" ) ; do
		if ask_user "Do you want to edit $file?" ; then
			eval "$idea_exe $file"
		fi
	done
}
