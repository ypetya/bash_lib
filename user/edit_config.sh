import user.load_config
import user.ask
import set_separator

function user.edit_config() {
	local line key value
	set_separator
	select line in $(cat ~/.user_config | sort) Quit
	do
		if [ "$line" == "Quit" ] ; then
			echo bye
			reset_separator
			return
		fi
		key="$( echo $line | cut -d '=' -f 1 )"
		value="$( echo $line | cut -d '=' -f 2 )"
		
		user.edit_config.print_kv "$key" "$value"
	
		user.ask 'New value (without quotes)?' value
		
		sed -ie "s/$key=.*/$key=\"$value\"/" ~/.user_config
		user.load_config
		reset_separator
		return
	done
}

function user.edit_config.print_kv() {
		print "Key : "
		print yellow "$1\n"
		print "Value : "
		print yellow "$2\n"
}
