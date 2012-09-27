using Sxml;
// other example: http://git.gnome.org/browse/valadoc/tree/src/libvaladoc/importer/girdocumentationimporter.vala

public class Sxml.Test : Object {

}

void main () {
	MarkupTokenType current_token;
	MarkupSourceLocation begin;
	MarkupSourceLocation end;
	ErrorReporter reporter = new ErrorReporter();
	MarkupReader reader = new MarkupReader ("test/testmap.tmx", reporter);

	current_token = reader.read_token (out begin, out end);
	while (current_token != MarkupTokenType.EOF) {
		current_token = reader.read_token (out begin, out end);
		if(reader.name != "tile") {
			print(@"$current_token, name: %s, content: %s\n",reader.name, reader.content);
			reader.print_attributes();
		}
	}
}