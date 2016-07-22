# decode html entities,
# unicode entities coming from a html

function string.decode_html_entity() {
	perl -C -MHTML::Entities -pe 'decode_entities($_);'
}
