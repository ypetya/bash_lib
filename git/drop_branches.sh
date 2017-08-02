import print.print
import git.drop_local_branch
import git.drop_remote_branch_at_origin

function git.drop_branches() {
    echo "Removing branches interactive..."
    while (( $# > 0 )) ; do
        local branch="$1"
        print yellow " *** Dropping Branch : $branch\n"
        git.drop_local_branch "$branch"
        git.drop_remote_branch_at_origin "$branch"
        shift
    done
    print yellow " *** Done\n"
}
