import print.print
import user.ask_user
import git.is_local_branch

function git.drop_local_branch() {
    local branch="${1? param missing - branch}"

    if ! git.is_local_branch "$branch" ; then
        return 1
    fi

    if ! git branch -d $branch &&
        ask_user "Dropping branch $branch was unsuccessfull - it has modifications - are you sure you still want to drop it?"
    then
        git branch -D $branch
    fi
}