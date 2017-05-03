import file.is_directory
import find.blacklist
import set_separator

# Example usage: 
#
# 1. create a directory where you want to run the script
# 2. call the script with the params of the resource target dir, which will be scanned through for docx,mobi,doc,pdf
# 3. voila, you got all the files
function collect_all_documents() {
	local root_dir=${1? param missing - root_dir}
	if is_directory "$root_dir" ; then

		echo "Collecting documents"
		echo " from directory : $root_dir"
		echo " to directory : $PWD"

		set_separator
	  files=( $(
		find.blacklist "$root_dir" -type f \
		-iname '\*.docx' \
		-o -iname '\*.mobi' \
		-o -iname '\*.doc' \
		-o -iname '\*.pdf' 
		) )

		echo "${#files[@]} documents found."

	  for file in ${files[@]} ; do
			cp -v "$file" .
	  done
		reset_separator
	else
		echo "No such directory : $root_dir"
	fi
}
