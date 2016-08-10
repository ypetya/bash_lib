import print.error
import file.is_file
import user.config.creates

function user.config.load() {
	if ! is_file ~/.user_config ; then
		error "Can not find config file, creating"
		user.config.creates
	fi
	source ~/.user_config
}
