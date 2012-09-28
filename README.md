simple-xml-reader-vala
======================

Very Simple XML Reader forked from valadoc

        make
        make install

Example
=======

This example outputs the complete xml on the console

```vala
using Sxml;
void main () {
        MarkupTokenType current_token;
        MarkupSourceLocation begin;
        MarkupSourceLocation end;
        ErrorReporter reporter = new ErrorReporter();
        MarkupReader reader = new MarkupReader ("test/test.xml", reporter);
        
        current_token = reader.read_token (out begin, out end);
        while (current_token != MarkupTokenType.EOF) {
        	current_token = reader.read_token (out begin, out end);
        	print(@"$current_token, name: %s, content: %s\n",reader.name, reader.content);
        	reader.print_attributes();
        }
}
```