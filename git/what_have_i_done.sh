import first git.ensure_clean

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
function git.what_have_i_done() {
  local check="${GIT_COMMITTER_EMAIL? variable missing}"
  if git.ensure_clean ; then
	  git log --pretty=format:"%Cred%h%Creset;%Cgreen%ad%Creset;%aE;%s" \
		--branches --date=relative |
	  grep "$check" |
	  cut --delimiter=";" -f1,2,4 |
	  first 20
  fi
}
