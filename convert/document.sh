# convert.document converts documents to other type
# using utility pandoc
# example usage:
# convert.document my_notes.md rtf

function convert.document() {
    require_package 'pandoc'
    local file="${1? param missing - input file}"
    local output_format="${2? param missing - output format}"
    local file_basename="${file%.*}"

    pandoc -s "$file" -o "$file_basename.$output_format"
}