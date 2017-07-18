import git.drop_local_branch
import git.drop_remote_branch_at_origin

function git.drop_branches() {
    echo "Removing branches interactive..."
    while (( $# > 0 )) ; do
        local branch="$1"
        echo " *** Dropping Branch : $branch"
        git.drop_local_branch "$branch"
        git.drop_remote_branch_at_origin "$branch"
        shift
    done
    echo " *** Done"
}
