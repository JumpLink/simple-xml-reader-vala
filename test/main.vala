using Sxml;

public class Sxml.Example : DataReader, Object {
	protected MarkupTokenType current_token {get; set;}
	protected MarkupSourceLocation begin {get; set;}
	protected MarkupSourceLocation end {get; set;}
	protected XmlStreamReader reader {get; set;}
	public string path { get; construct set; }

	public Example (string path, string filename) {
		reader = new XmlStreamReader (path+filename);
	}
	public void parse() {
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
	Example xml = new Example("test/","testmap.tmx");
	xml.parse();
}