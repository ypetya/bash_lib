# Bash file exports:
# keywords after export
# or function
s/^export\s+([^=]+)$|^function\s+([^(]+).*$/\1\2/p
