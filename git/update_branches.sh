import git.is_local_branch
import git.checkout.branch

# pull (checkout+rebase) all the passed local branches
# check if local branch exists
function git.update_branches(){
    while (( $# > 0 )) ; do
        local branch="$1"
        if git.is_local_branch "$branch" ; then
            git checkout.branch "$branch"
        fi
        shift
    done
}