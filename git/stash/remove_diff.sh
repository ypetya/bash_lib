import require_package
import print user.ask
import git.stash.remove

function git.stash.remove_diff() {
	require_package git
	print yellow "Your stash contains:\n"
	git stash list

	local stash=($(git stash list | cut -d ':' -f 1))
	local remove_list=()

	for stash_item in ${stash[@]} ; do
		print yellow " --- $stash_item ------ \n"

		git stash show $stash_item

		print yellow " Do you want to keep this "
		if user.ask "$stash_item ?" ; then
			remove_list=(${remove_list[@]} keep)
		else
			remove_list=(${remove_list[@]} remove)
		fi
	done

	git.stash_remove ${remove_list[@]}
}
