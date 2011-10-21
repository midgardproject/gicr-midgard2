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

	public class XMLDocumentViewImporter : XMLImporter {

		public XMLDocumentViewImporter (GICR.Session session, string path, int uuidB, Xml.Doc* doc) {
			base (session, path, uuidB, doc);
		}

		~XMLDocumentViewImporter () {
			/* Force parent destructor */
		}

                /** 
                 * {@inheritDoc}
                 */
                public override Gee.HashMap get_namespaces() {
                        return null;
                }

                /** 
                 * {@inheritDoc}
                 */
		public override void execute () {

		}

		/* 
		 * {@inheritDoc}
		 */
		public override Midgard2CR.Node create_cr_node (Xml.Node xmlNode) {
			return null;
		}

		/**
		 * {@inheritDoc}
		 */
		public override Midgard2CR.Node[] create_cr_nodes (Xml.Node xmlNode) {
			return null;
		} 
	}
}
