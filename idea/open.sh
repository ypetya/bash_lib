import user.load_config
# Example usage:
# idea $(grep.blacklist -rn 'function.*Test' | cut -d ':' -f 1)
# will open file matching function.*Test
function idea.open() {
	local mode
	user.load_config
	local command="$idea_exe "
	while (( $# > 0 )) ; do
		mode="$1"
		case $mode in
			open_matching)
				shift
				idea.open_matching "$@"
				return 0
				;;
			help)
				echo "available commands : open_matching"
				return 1
				;;
		esac

		command="$command $mode"
		shift
	done
	eval $command
}
alias idea="idea.open"
