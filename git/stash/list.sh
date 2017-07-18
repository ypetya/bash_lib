# show up stash content, only the human readable part

function git.stash.list() {
	git stash list | sed -r 's/^[^:]+: (.*)$/\1/'
}
