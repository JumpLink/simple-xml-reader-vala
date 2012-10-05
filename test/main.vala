using Sxml;	
// other example: http://git.gnome.org/browse/valadoc/tree/src/libvaladoc/importer/girdocumentationimporter.vala

public class Sxml.Example : DataReader {
	public Example (string path, string filename) {
		reader = new XMLStreamReader (path+filename);
	}
	public void parse() {
		//current_token = reader.read_token (out begin, out end);
		next();
		while (current_token != MarkupTokenType.EOF) {
			next();
			if(reader.name != "tile") {
				print(@"$current_token, name: %s, content: %s\n",reader.name, reader.content);
				reader.print_attributes();
			}
		}
	}
}

void main () {
	// MarkupTokenType current_token;
	// MarkupSourceLocation begin;
	// MarkupSourceLocation end;
	// XMLStreamReader reader = new XMLStreamReader ("test/testmap.tmx");
	Example xml = new Example("test/","testmap.tmx");
	xml.parse();


}