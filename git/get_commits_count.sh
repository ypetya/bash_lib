import string.to_lower list_counts_desc

function git.get_commits_count() {
	#git log --pretty=oneline | wc -l
	git log --pretty=format:"%aE" |
	string.to_lower |
	list_counts_desc
}
