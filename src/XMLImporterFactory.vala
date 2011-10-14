/* 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

namespace Midgard2CR {

	public class XMLImporterFactory : Object {

		public static XMLImporter create_importer_from_data (GICR.Session session, string xmlData) throws GICR.RepositoryException {

			/* Create document from given file path */
		        Xml.Doc* doc = Xml.Parser.parse_memory (xmlData, xmlData.length);
		        if (doc == null) {
				throw new GICR.RepositoryException.INTERNAL ("Can not create xml document from given xml data");
			}

			return create_importer (session,doc);
		}

		public static XMLImporter create_importer_from_file (GICR.Session session, string filePath) throws GICR.RepositoryException {

			/* Create document from given file path */
		        Xml.Doc* doc = Xml.Parser.parse_file (filePath);
		        if (doc == null) {
				throw new GICR.RepositoryException.INTERNAL ("Can not create xml document from given '%s' filepath", filePath);
			}

			return create_importer (session, doc);
	        }
		
		private static XMLImporter create_importer (GICR.Session session, Xml.Doc* doc) throws GICR.RepositoryException {
			Xml.Node* root = doc->get_root_element ();
			if (root == null) 
				throw new GICR.RepositoryException.INTERNAL ("Invalid xml data. Can not determine root node");

			/* Assume that root with name node means system view, document one otherwise */
			if (root->name == "node")
				return new XMLSystemViewImporter (session, doc);
			
			return new XMLDocumentViewImporter (session, doc);
		}			
	}
}
