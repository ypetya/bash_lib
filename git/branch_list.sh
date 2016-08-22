# git branch <pattern>
# git br defaults to --list
# --list shows local branches
# -r shows remotes
# -a shows both remotes and local
# --sort=key : see git help git-for-each-ref for keys
# <pattern> is a shell pattern
function git.branch_list() {
	local interactive="${1? param missing - local/all/remote or pattern}"
	case $interactive in
		local)
			git branch --list --sort='-creatordate' | tr -d '* '
			;;
		all)
			git branch --list -a --sort='-creatordate' | tr -d '* '
			;;
		remote)
			git branch --list -r --sort='-creatordate' | tr -d '* '
			;;
		*)
			local pattern="*${1}*"
			git branch --list -a --sort='-creatordate' $pattern | tr -d '* '
			;;
	esac
}
