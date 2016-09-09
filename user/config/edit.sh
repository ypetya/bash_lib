import user.config.load
import user.ask
import set_separator

function user.config.edit() {
	local line
	set_separator
	select line in $(cat ~/.user_config | sort) "New key-value pair" Quit
	do
		case "$line" in
			"New key-value pair")
				user.config.edit.new
				;;
			Quit)
				echo bye
				;;
			*)  user.config.edit.edit "$line"
				;;
		esac

		user.config.load
		reset_separator
		return
	done
}

function user.config.edit.new() {
	local key value
	user.ask 'New key (without quotes)?' key
	user.ask 'New value (without quotes)?' value
	user.config.edit.print_kv "$key" "$value"

	echo "$key=\"$value\"" >> ~/.user_config
}

function user.config.edit.edit() {
	local key value
	local line="$1"
	key="$( echo $line | cut -d '=' -f 1 )"
	value="$( echo $line | cut -d '=' -f 2,3,4,5,6,7,8 )"

	user.config.edit.print_kv "$key" "$value"

	echo
	user.ask 'New value (without quotes)?' value

	sed -ie "s|$key=.*|$key=\"$value\"|" ~/.user_config
}

function user.config.edit.print_kv() {
		print "Key : "
		print yellow "$1\n"
		print "Value : "
		print yellow "$2\n"
}
