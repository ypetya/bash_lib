#!/bin/bash

import first

function git_what_have_i_done() {
  local check="${GIT_COMMITTER_EMAIL? variable missing}"
  # Git help log
  # ------------
  # %h: abbreviated commit hash
  # %ad: author date (format respects --date= option)
  # %aE: author email (respecting .mailmap, see git-shortlog(1) or git-blame(1))
  # %s: subject
  #
  # Author vs committer :
  # in large repositories committer is the one who applies changes
  # of an author
  git log --pretty=format:"%Cred%h%Creset;%Cgreen%ad%Creset;%aE;%s" \
	--branches --date=relative | \
  grep "$check" | \
  cut --delimiter=";" -f1,2,4 | \
  first 20
}
