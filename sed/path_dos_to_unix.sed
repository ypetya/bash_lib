#exec: !/usr/bin/sed -r -f path_dos_to_unix.sed
# windows path to unix path, execute with
# convert drive letter
s/^([A-Za-z]):/\/\1/
# convert slashes
s/\\/\//g
