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

	public class Node : GLib.Object, GICR.Item {

		private Midgard.Object midgardNode = null; 
		private GICR.Session session = null;
		private GICR.Node parent = null;
		private bool isRoot = false;

		/**
		 * Constructor
		 *
		 * Newly instatiated node is a root node if:
		 * * parent is null
		 * * midgardNode is stored in table (determined by valid guid property)
		 * * midgardNode's up property is 0
		 *
		 * @param session a {@link GICR.Session} to which node is associated
		 * @param midgardNode Midgard.Object of 'midgard_node' type which represents SQL record of the node
		 * @param parent a Node which is a parent for given node.
		 * A node is likely a root node if null given as parent
		 */
		public Node (GICR.Session session, Midgard.Object? midgardNode, GICR.Node? parent) {
			this.session = session;
			this.midgardNode = midgardNode;
			var up_prop_value = 0;
			midgardNode.get ("up", up_prop_value);
			if (parent == null) {
				if (midgardNode != null 
					&& (Midgard.is_guid (midgardNode.guid) && up_prop_value != 0)) {
					this.isRoot = true;
				}
			}
		}

		/**
		 * {@inheritDoc}
		 */
		public Node add_node (string relPath, string? primaryNodeTypeName) throws GICR.ItemExistsException, GICR.PathNotFoundException, GICR.ConstraintViolationException, GICR.VersionException, GICR.LockException, GICR.InvalidArgumentException, GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public void order_before (string srcChildRelPath, string destChildRelPath) throws GICR.UnsupportedRepositoryOperationException, GICR.ConstraintViolationException, GICR.ItemNotFoundException, GICR.VersionException, GICR.LockException, GICR.InvalidArgumentException , GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Property set_node_property (string name, Value val, int? type) throws GICR.ValueFormatException, GICR.VersionException, GICR.LockException, GICR.ConstraintViolationException, GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public Node get_node (string relPath) throws GICR.PathNotFoundException, GICR.InvalidArgumentException, GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public Node[] get_nodes (string[]? filter) throws GICR.RepositoryException{ 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Property get_node_property (string relPath) throws GICR.PathNotFoundException, GICR.InvalidArgumentException, GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public Value get_property_value (string name, int? type) throws GICR.PathNotFoundException, GICR.ValueFormatException, GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Property[] get_properties (string[]? filter) throws GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public ValueArray get_properties_values (string[] filter, bool dereference = true) throws GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Item get_primary_item () throws GICR.RepositoryException, GICR.ItemNotFoundException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public string get_identifier () throws GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public int get_index() throws GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Property[] get_references (string? name) throws GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Property[] get_weak_references (string? name) throws GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public bool has_node (string relPath) throws GICR.RepositoryException, GICR.InvalidArgumentException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public bool has_property (string relPath) throws GICR.InvalidArgumentException, GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public bool has_nodes () throws GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public bool has_properties () throws GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.NodeType get_primary_node_type () throws GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.NodeType[] get_mixin_node_types () throws GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 */
		public bool is_node_type (string nodeTypeName) throws GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public void set_primary_type (string nodeTypeName) throws GICR.RepositoryException, GICR.ConstraintViolationException, GICR.NoSuchNodeTypeException, GICR.VersionException, GICR.LockException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public void add_mixin (string mixinName) throws GICR.LockException, GICR.NoSuchNodeTypeException, GICR.ConstraintViolationException, GICR.VersionException, GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public void remove_mixin (string mixinName) throws GICR.NoSuchNodeTypeException, GICR.ConstraintViolationException, GICR.VersionException, GICR.LockException, GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public bool can_add_mixin (string mixinName) throws GICR.NoSuchNodeTypeException, GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.NodeDefinition get_definition () throws GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public void update (string srcWorkspace) throws GICR.NoSuchWorkspaceException, GICR.InvalidItemStateException, GICR.AccessDeniedException, GICR.LockException, GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public string get_corresponding_node_path (string workspaceName) throws GICR.ItemNotFoundException, GICR.NoSuchWorkspaceException, GICR.AccessDeniedException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public Node[] get_shared_set () throws GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public void remove_shared_set () throws GICR.VersionException, GICR.LockException, GICR.ConstraintViolationException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public void remove_share () throws GICR.VersionException, GICR.LockException, GICR.ConstraintViolationException, GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public bool is_checked_out() throws GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public bool is_locked() throws GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public void follow_lifecycle_transition (string transition) throws GICR.UnsupportedRepositoryOperationException, GICR.InvalidLifecycleTransitionException, GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public string[] get_allowed_lifecycle_transitions () throws GICR.UnsupportedRepositoryOperationException, GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */		
		public string get_path () throws GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public string get_name () throws GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Item get_ancestor (int depth) throws GICR.RepositoryException, GICR.ItemNotFoundException, GICR.AccessDeniedException {
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Item get_parent () throws GICR.RepositoryException, GICR.ItemNotFoundException, GICR.AccessDeniedException {
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public int get_depth () throws GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Session get_session () throws GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public bool is_node () {
			return true;
		}

		/**
		 * {@inheritDoc}
		 */
		public bool is_new () {
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public bool is_modified () {
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public bool is_same (GICR.Item other_item) throws GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public void refresh (bool keep_changes) throws GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public void remove () throws GICR.RepositoryException, GICR.VersionException, GICR.LockException, GICR.ConstraintViolationException, GICR.AccessDeniedException {
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}
	}
}
