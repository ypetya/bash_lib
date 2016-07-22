import create_map

create_map sed_extract_import_vars

sed_extract_import_vars=(
# in bash, print only the second part of the variable
# E.g : import print.debug -> debug
[sh]='s/^import[ ](-f )?(.*)$/\2/p'
# in js we are interested in LHS of "from"
[js]='s/^import (.*) from .*;/\1/p'
)

export sed_extract_import_vars
