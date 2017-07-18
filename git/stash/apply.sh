# looks for a specific pattern in stash list to apply
# if found, asks the user whether need to apply or not
import print

function git.stash.apply() {
	local pattern="${1? param missing - pattern to match stash name}"
	local line stash
	local stashes=()

	while read -r line ; do
		stash="$( echo $line | cut -d ':' -f 1)"
		print yellow "Found stash: "
		echo $line
		stashes=( ${stashes[@]} $stash )
	done <<EOT
	$( git stash list | grep $pattern )
EOT

	for stash in ${stashes[@]} ; do
		if user.ask "Do you want to apply $stash ?" ; then
			git stash apply $stash
		fi
	done
}
