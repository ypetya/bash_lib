#!/bin/bash

function git.change_identity() {
  read -rp "New commiter and author name? " NEW_NAME
  GIT_AUTHOR_NAME="$NEW_NAME"
  GIT_COMMITTER_NAME="$NEW_NAME"

  read -rp "New email? " GIT_AUTHOR_EMAIL

  GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

  export GIT_AUTHOR_NAME
  export GIT_AUTHOR_EMAIL
  export GIT_COMMITTER_NAME
  export GIT_COMMITTER_EMAIL
}
