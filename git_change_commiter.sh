#!/bin/bash

# This function will change the commiter data on a repository
function git_change_commiter() {
  read -rp "Old email to change? " OLD_EMAIL
  export OLD_EMAIL
  read -rp "New commiter and author name? " NEW_NAME
  export NEW_NAME
  read -rp "New email? " NEW_EMAIL
  export NEW_EMAIL

  echo "Changing $OLD_EMAIL -> $NEW_EMAIL"

  git filter-branch --commit-filter '
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
