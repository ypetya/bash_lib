
function ssh.choose_key() {
	local key_files=( ~/.ssh/*.pub )
	local keys=()
	for key in ${key_files[@]} ; do
		key=${key##*/}
		keys=( ${key%*.pub} "${keys[@]}")
	done


	select key in "${keys[@]}" ; do
		echo $key
		return 0
	done
}


