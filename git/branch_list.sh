# git branch <pattern>
# git br defaults to --list
# --list shows local branches
# -r shows remotes
# -a shows both remotes and local
# --sort=key : see git help git-for-each-ref for keys
# <pattern> is a shell pattern
#
# Usage
# =====
#
# first parameter: optional - local/all/remote
# second parameter: optional - pattern
import print.debug
import git.fetch
function git.branch_list() {
	set -f
	local interactive="${1? param missing - local/all/remote or pattern}"
	local command="git branch --list --sort='-creatordate' "
	while (( "$#" )); do
		interactive="$1"
		case $interactive in
			local)
				;;
			all)
				git.fetch
				command="$command -a "
				;;
			tag)
				# TODO fix ordering at list tags
				command="git tag --list "
				;;
			remote)
				git.fetch
				command="$command -r "
				;;
			*)
				local pattern="*${1}*"
				command="$command $pattern "
				;;
		esac
		shift
	done
	debug $command
	eval $command | tr -d '* '
	set +f
}
