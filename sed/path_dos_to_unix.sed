#exec: !/usr/bin/sed -r -f path_dos_to_unix.sed
# windows path to unix path, execute with
# convert drive letter
s/^([A-Z]):/\/\1/
# convert slashes
s/\\/\//g
