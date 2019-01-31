import print.print

function git.is_local_branch() {
    local branch="${1?param missing - branch}"

    if [ ! "$(git branch --list "$branch" | wc -l)" = "1" ] ; then
        print red 'No such local branch!\n'
        return 1
    fi

    return 0
}