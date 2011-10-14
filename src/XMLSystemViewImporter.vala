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

	public class XMLSystemViewImporter : XMLImporter {

		public XMLSystemViewImporter (GICR.Session session, Xml.Doc* doc) {
			base (session, doc);
		}

		~XMLSystemViewImporter () {
			/* Force parent destructor */	
		}

		/** 
		 * {@inheritDoc}
		 */
		public override Gee.HashMap get_namespaces() {
			return null;
		}

		/* 
		 * {@inheritDoc}
		 */
		public override GICR.Node create_cr_node (Xml.Node xmlNode) {

			/* Create midgard_node from node */

			/* Create GICR.Node */

			return null;
		}

		/**
		 * {@inheritDoc}
		 */
		public override GICR.Node[] create_cr_nodes (Xml.Node xmlNode) {
			return null;
		} 
	}
}
