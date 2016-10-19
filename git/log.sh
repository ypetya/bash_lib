
# git log has the following optional
# --name-status
# --name-only
# --stat
# 
# this one is also very compact:
# git log --name-only --oneline
function git.log() {
	git log --oneline --name-status --find-renames
}
