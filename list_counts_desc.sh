# outputs a descending list of different lines with the #count
function list_counts_desc() {
	sort | uniq -c | sort -r
}
