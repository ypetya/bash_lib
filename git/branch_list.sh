# git branch <pattern>
# git br defaults to --list
# --list shows local branches
# -r shows remotes
# -a shows both remotes and local
# --sort=key : see git help git-for-each-ref for keys
# <pattern> is a shell pattern
function git.branch_list() {
	if (( $# > 0 )) ; then
		local pattern="*${1}*"
		git branch --list -a --sort='-creatordate' $pattern
	else
		git branch --list -a --sort='-creatordate'
	fi
}
