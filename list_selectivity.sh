# calculates a list's selectivity in percentage
#
# selectivity_percentage = uniq_rows / total_rows  * 100

function list_selectivity() {
	declare -li total uni
	for ans in $(tee \
		>(number_of_uniq_lines) \
		>(number_of_lines) \
		 &> /dev/null ) ; do
		echo $ans
		if [ "${ans:0:1}" == "u" ] ; then
			let total=$( expr ${ans:6} '*' 100 )
		else
			let uni=${ans:6}
		fi
	done

	echo "selectivity:$( expr $total '/' $uni )%"
}


function number_of_lines() {
	declare -li num_lines=$(wc -l)
	echo "total:$num_lines"
}

function number_of_uniq_lines() {
	declare -li num_uniq_lines=$( sort | uniq | wc -l )
	echo "uniq_:$num_uniq_lines"
}
