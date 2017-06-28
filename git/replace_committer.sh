import user.ask
# This function will change the commiter data on a repository
function git.replace_committer() {
  user.ask "Old email to change? " OLD_EMAIL
  export OLD_EMAIL
  user.ask "New commiter and author name? " NEW_NAME
  export NEW_NAME
  user.ask "New email? " NEW_EMAIL
  export NEW_EMAIL

  echo "Changing $OLD_EMAIL -> $NEW_EMAIL"

  # -f : force git to update ref-log backup
  # an alternative way would be
  # git update-ref -d refs/original/refs/heads/master
  git filter-branch -f --commit-filter '
    if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]; then
            GIT_COMMITTER_NAME="$NEW_NAME";
            GIT_AUTHOR_NAME="$NEW_NAME";
            GIT_COMMITTER_EMAIL="$NEW_EMAIL";
            GIT_AUTHOR_EMAIL="$NEW_EMAIL";
            git commit-tree "$@";
    else
            git commit-tree "$@";
    fi' HEAD
}
