# return tags
#
# sort order:
# ----------
# version:refname  treated as versions
# -creatordate date descending
function git.tags() {
	git tag -l --sort="version:refname" $@
}

alias tags="git.tags"
