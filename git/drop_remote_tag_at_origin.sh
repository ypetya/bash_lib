import user.ask

function git.drop_remote_tag_at_origin() {
	local tag="${1? param missing - tag}"
	local FORCE="$2"
	if [ "$FORCE" == 'force' ] ||
		ask_user "Do you want to delete remote tag : $tag"
	then
		print red "$tag - deleting\n"
		git push origin :refs/tags/$tag
	else
		print yellow "$tag - skipping delete\n"
	fi
}
