using Valadoc;
void main () {
	MarkupTokenType current_token;
	MarkupSourceLocation begin;
	MarkupSourceLocation end;
	Valadoc.ErrorReporter reporter = new ErrorReporter();
	Valadoc.MarkupReader reader = new MarkupReader ("test/testmap.tmx", reporter);
	current_token = reader.read_token (out begin, out end);
	print(@"$current_token \n");
	current_token = reader.read_token (out begin, out end);
	print(@"$current_token \n");
	current_token = reader.read_token (out begin, out end);
	print(@"$current_token \n");
}