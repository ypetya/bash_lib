function file.is_file_or_directory() {
	if [ ! -f "${1? - param missing : please specify a name!}" ] && \
	   [ ! -d "$1" ]; then
		return 1
	fi
}

alias is_file_or_directory='file.is_file_or_directory'
