import create_map

create_map sed_extract_imports

sed_extract_imports=(
[sh]='s/^import[ ](-f )?+(.*)$/\2/p'
[js]='s/^import .* from '"'"'(.*)'"'"';/\1/p'
)

export sed_extract_imports
