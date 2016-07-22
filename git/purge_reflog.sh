function git.purge_reflog() {
	rm -rf .git/refs/original/ && \
	git reflog expire --all &&  \
	git gc --aggressive --prune
}
