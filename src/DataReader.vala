using Sxml;
using Gee;

public interface Sxml.DataReader : Object {

	protected abstract MarkupTokenType current_token {get; set;}
	protected abstract MarkupSourceLocation begin {get; set;}
	protected abstract MarkupSourceLocation end {get; set;}
	protected abstract XmlStreamReader reader {get; set;}

	/**
	 * Path of Data
	 */
	public abstract string path { get; construct set; }

	protected void next () {
		MarkupSourceLocation _begin;
		MarkupSourceLocation _end;
		current_token = reader.read_token (out _begin, out _end);
		begin = _begin;
		end = _end;
	}

	protected void reset () {
		reader.reset ();
		current_token = MarkupTokenType.NONE;
	}

	protected bool is_start_element (string name) {
		if (current_token != MarkupTokenType.START_ELEMENT || reader.name != name) {
			return false;
		} else
			return true;
	}

	protected bool is_end_element (string name) {
		if (current_token != MarkupTokenType.END_ELEMENT || reader.name != name) {
			return false;
		} else
			return true;
	}

	protected void start_element (string name) {
		if (!is_start_element(name)) {
			// error
			error ("expected start element of `%s'".printf (name));
		}
	}

	protected void end_element (string name) {
		if (!is_end_element(name)) {
			// error
			error ("expected end element of `%s'".printf (name));
		}
		next ();
	}

	protected void print_node () {
		print(reader.name+" ");
		reader.print_attributes();
	}

	protected void print_location () {
		print(@"begin\n-------\npos: $(begin.pos)\nline: $(begin.line)\ncolumn: $(begin.column)\n");
		print(@"end\n-------\npos: $(end.pos)\nline: $(end.line)\ncolumn: $(end.column)\n");
		print("\n");
	}
}