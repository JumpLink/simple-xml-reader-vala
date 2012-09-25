/* markuptokentype.vala
 *
 * Copyright (C) 2008-2009  Jürg Billeter
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 * Author:
 * 	Jürg Billeter <j@bitron.ch>
 */


public enum Valadoc.MarkupTokenType {
	NONE,
	COMMENT,
	START_ELEMENT,
	END_ELEMENT,
	TEXT,
	EOF;

	public string to_string () {
		switch (this) {
		case START_ELEMENT:
			return "start element";

		case END_ELEMENT:
			return "end element";

		case TEXT:
			return "text";

		case EOF:
			return "end of file";

		default:
			return "unknown token type";
		}
	}
}