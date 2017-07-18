import print.print
import user.ask_user

function git.drop_local_branch() {
    local branch="${1? param missing - branch}"

    if [ ! "$(git br --list "$branch" | wc -l)" = "1" ] ; then
        print red 'No such local branch!\n'
        return 1
    fi

    if ! git branch -d $branch &&
        ask_user "Dropping branch $branch was unsuccessfull - it has modifications - are you sure you still want to drop it?"
    then
        git branch -D $branch
    fi
}