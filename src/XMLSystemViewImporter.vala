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

		public XMLSystemViewImporter (GICR.Session session, string path, int uuidB, Xml.Doc* doc) {
			base (session, path, uuidB, doc);
		}

		~XMLSystemViewImporter () {
			/* Force parent destructor */	
		}

		/* Namespaces */

		/** 
		 * {@inheritDoc}
		 */
		public override Gee.HashMap get_namespaces() {
			if (this.namespaces == null)
				return this.namespaces;

			this.namespaces = new Gee.HashMap <string, string>();
			/* TODO, collect namespaces */
			return this.namespaces;
		}

		/* Node and properties */

		private string? get_attribute_by_name (Xml.Node *node, string attrName) {
			for (Xml.Attr* prop = node->properties; prop != null; prop = prop->next) {
				if (prop->name == attrName) {
					//stdout.printf ("'%s:%s' \n",prop->ns->prefix, prop->ns->href);
					return prop->children->content;
				}
			}
			return null;
		}

		private string get_property_value (Xml.Node *node) {
			for (Xml.Node* iter = node->children; iter != null; iter = iter->next) {
				if (iter->type != Xml.ElementType.ELEMENT_NODE) 
					continue;	
				return iter->children->content;
			}
			return "";
		}

		private string get_nodetype (Xml.Node *node) {
			for (Xml.Node* iter = node->children; iter != null; iter = iter->next) {
				if (iter->type != Xml.ElementType.ELEMENT_NODE) 
					continue;
				if (iter->name != "property")
					continue;
				var ntype = get_attribute_by_name (iter, "name");
				if (ntype == "jcr:primaryType")
					return get_property_value (iter);
			}
			return "";
		}

		private void add_node (Xml.Node *node, Midgard2CR.Node parentNode) {
			for (Xml.Node* iter = node->children; iter != null; iter = iter->next) {
				if (iter->type != Xml.ElementType.ELEMENT_NODE
					|| iter->name != "node") 
					continue;	
				var newNode = create_cr_node (iter, parentNode);	
				add_node (iter, newNode);
			}
		} 

		public override void execute () {
			Xml.Node* root = this.xmlDocument->get_root_element ();

			if (root == null)
				throw new GICR.RepositoryException.INTERNAL ("Can not get root element from given xml document");

			var rootNode = this.session.get_node (this.parentNodePath);
			var newNode = this.create_cr_node (root, (Midgard2CR.Node) rootNode);
			this.add_node (root, newNode);
		}

		private void add_properties (Xml.Node *node, Midgard2CR.Node crNode) {
			for (Xml.Node* iter = node->children; iter != null; iter = iter->next) {
				if (iter->type != Xml.ElementType.ELEMENT_NODE
					|| iter->name != "property") 
					continue;
				/* Ignore primary type property */
				if (get_attribute_by_name (iter, "name") == "jcr:primaryType")
					continue;
				stdout.printf ("Set '%s' property of '%s' type (%s) \n", 
					get_attribute_by_name (iter, "name"),                          
					get_attribute_by_name (iter, "type"), 
                                        get_property_value (iter)
                                );
 
				crNode.set_node_property (
					get_attribute_by_name (iter, "name"),
					get_property_value (iter),
					GICR.PropertyType.value_from_name (get_attribute_by_name (iter, "type"))
				);
			}
		}

		public Midgard2CR.Node create_cr_node (Xml.Node *parentXmlNode, Midgard2CR.Node parentNode) {
			stdout.printf ("Create new node '%s' ('%s') under '%s' \n", 
				this.get_attribute_by_name (parentXmlNode, "name"),
				get_nodetype (parentXmlNode),
				parentNode.get_name ());
			var newNode = (Midgard2CR.Node) parentNode.add_node (this.get_attribute_by_name (parentXmlNode, "name"), get_nodetype (parentXmlNode));
			add_properties (parentXmlNode, newNode);
			return newNode;
		}

		/**
		 * {@inheritDoc}
		 */
		public override Midgard2CR.Node[] create_cr_nodes (Xml.Node xmlNode) {
			return null;
		} 
	}
}
