import get_source_dir
import get_random
import list_get_row

function get_cycling_tip() {
	local dir
	get_source_dir dir
	local fortune_file="$dir/cycling-tips.txt"
	local lines=$( wc -l $fortune_file | cut -d ' ' -f 1)
	let line=$(get_random $lines)
	list_get_row $line "$fortune_file"
}
