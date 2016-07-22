function file.is_file () {
	if [ ! -f "${1? - param missing : please specify filename!}" ] ; then
		return 1
	fi
}

alias is_file='file.is_file'
