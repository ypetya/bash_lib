import print.print
import user.ask
import user.config.load
import chrome

function git.push() {
	# Replacing stdout with stderr
	local git_output="$(git push $@ 2>&1 >/dev/null)"
	if [ "$?" == "0" ] ; then
		print green "Done.\n"
		local stash_url="$(echo "$git_output" | sed -r "s/.*(http[^\s]+).*$/\1/" )"
		if (( ${#stash_url} >0 )) ; then
			echo "$stash_url"
			if user.ask 'Would you like to open in browser?'
			then
				print yellow ' * Opening browser...\n'
				chrome open "$stash_url"
			fi
		fi
	else
		print red "Err:\n"
		echo "$git_output"
	fi
}
