function git.add_submodule() {
    local dir="${1? param missing - directory}"
    pushd $dir
    local remote_url="$(git remote get-url origin)"
    popd
    git submodule add "$remote_url" "$dir"
}