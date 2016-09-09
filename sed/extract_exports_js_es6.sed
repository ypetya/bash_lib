# ecma script 6 file exports:
# keywords after export default
# or function
n
/export/{
s/\s$/$/p
:loop p
s/^export\s+(default|function)\s+([^;(}]+).*$/\\2/
/[;}]/q
n
b loop
}




