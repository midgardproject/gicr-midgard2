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

		public static XMLImporter create_importer_from_data (GICR.Session session, string parentNodePath, int uuidB, string xmlData) throws GICR.RepositoryException {

			/* Create document from given file path */
		        Xml.Doc* doc = Xml.Parser.parse_memory (xmlData, xmlData.length);
		        if (doc == null) {
				throw new GICR.RepositoryException.INTERNAL ("Can not create xml document from given xml data");
			}

			return create_importer (session,parentNodePath, uuidB, doc);
		}

		public static XMLImporter create_importer_from_file (GICR.Session session, string parentNodePath, int uuidB, string filePath) throws GICR.RepositoryException {

			/* Create document from given file path */
			string xmlData;
			try {
				FileUtils.get_contents (filePath, out xmlData);
				return create_importer_from_data (session, parentNodePath, uuidB, xmlData);
			} catch (GLib.FileError e) {
				throw new GICR.RepositoryException.INTERNAL (e.message);
			}
	        }
		
		private static XMLImporter create_importer (GICR.Session session, string path, int uuidB, Xml.Doc* doc) throws GICR.RepositoryException {
			Xml.Node* root = doc->get_root_element ();
			if (root == null) 
				throw new GICR.RepositoryException.INTERNAL ("Invalid xml data. Can not determine root node");

			/* Assume that root with name node means system view, document one otherwise */
			if (root->name == "node")
				return new XMLSystemViewImporter (session, path, uuidB, doc);
			
			return new XMLDocumentViewImporter (session, path, uuidB, doc);
		}			
	}
}
