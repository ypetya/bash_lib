import git.drop_local_branch
import git.drop_remote_branch_at_origin

function git.drop_branches() {
    echo "Removing branches interactive..."
    while (( $# > 0 )) ; do
        echo " *** Dropping Branch : $branch"
        git.drop_local_branch "$1"
        git.drop_remote_branch_at_origin "$1"
        shift
    done
    echo " *** Done"
}
