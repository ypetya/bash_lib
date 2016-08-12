import print.print
import user.ask
import user.config.load
import chrome

function git.push() {
	if git push $@ ; then
		user.config.load
		if (( ${#stash_url} >0 )) ; then
			if user.ask 'Would you like to open in browser?'
			then
				print yellow ' * Opening browser...\n'
				chrome open "$stash_url"
			fi
		fi
	fi
}
