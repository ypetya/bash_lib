import user.ask_user

function git.drop_local_branch() {
    local branch="${1? param missing - branch}"

    if ! git branch -d $branch &&
        ask_user "Dropping branch $branch was unsuccessfull - either has modifications or does not exist - are you sure you still want to drop it?"
    then
        git branch -D $branch
    fi
}