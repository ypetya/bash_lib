
# the return code of this function:
# 0: command execution normal -> has upstream
# other: error, -> no upstream
function git.branch_has_upstream() {
    git rev-parse @{u} > /dev/null 2>&1
}