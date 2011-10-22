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

	/* Basic interface to import CR nodes from xml ones */
	public abstract class XMLImporter : Object {

		/* Keep references to Session and Xml document */
		protected Xml.Doc* xmlDocument = null;
		protected GICR.Session session = null;
		protected string parentNodePath = null;
		protected int uuidBehavior = 0;
		protected Gee.HashMap namespaces = null;

		public XMLImporter (GICR.Session session, string parentNodePath, int uuidBehavior, Xml.Doc* Doc) {
			this.xmlDocument = Doc;
			this.session = session;
			this.parentNodePath = parentNodePath;
			this.uuidBehavior = uuidBehavior;
		}

		~XmlImporter () {
			delete this.xmlDocument;
		}

		/**
		 * List all namespaces of xml document.
		 *
		 * @return new Gee.HashMap with prefixes and namespaces */
		public abstract Gee.HashMap get_namespaces ();

		/**
		 * Executes import.
		 * 
		 * From associated xml document create Node objects and adds them to the repository.
		 */
		public abstract void execute ();

		/* 
		 * Create {@link Node} from Xml.Node.
		 *
		 * Created node should have all properties set
		 *
		 * @param xmlNode a {@link Xml.Node} to create Midgard2CR.Node node from 
		 * @return Midgard2CR.Node 
		 */
		//public abstract Midgard2CR.Node create_cr_node (Xml.Node xmlNode);

		/**
		 * Create {@link Node} nodes which are child of the node represented by given Xml.Node.
		 * 
		 * @param xmlNode a {link @Xml.Node} to create child Midgard2CR.Node node from
		 * @return array of {@link Node) child nodes
		 */
		public abstract Midgard2CR.Node[] create_cr_nodes (Xml.Node xmlNode);
	}
}
