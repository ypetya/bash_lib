#!/bin/bash

function git_what_have_i_done() {
  local check="${GIT_COMMITTER_EMAIL? variable missing}"
  # git help log
  # ------------
  # %h: abbreviated commit hash
  # %ad: author date (format respects --date= option)
  # %aE: author email (respecting .mailmap, see git-shortlog(1) or git-blame(1))
  # %s: subject
  git log --pretty=format:"%h;%ad;%aE;%s" --branches | grep "$check" | cut --delimiter=";" -f1,2,4 | head
}
