# git branch <pattern>
# git br defaults to --list
# --list shows local branches
# -r shows remotes
# -a shows both remotes and local
# <pattern> is a shell pattern
function git.branch_list() {
	if (( $# > 0 )) ; then
		local pattern="*${1}*"
		git branch --list -a $pattern
	else
		git branch --list -a
	fi
}
