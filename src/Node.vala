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

	public class Node : GLib.Object, GICR.Item, GICR.Node {

		private unowned Midgard.Object midgardNode = null;
		private Midgard.Object contentObject = null; 
		private Midgard2CR.Session session = null;
		private Node parent = null;
		private bool isRoot = false;
		private string name = null;
		private Gee.HashMap <string, Object>children = null;
		private Gee.HashMap <string, Object>properties = null;
		private bool isNew = true;
		private bool isModified = false;
		private bool toRemove = false;
		private string nodeType = "nt:folder";

		/**
		 * Constructor
		 *
		 * Newly instatiated node is a root node if:
		 * * parent is null
		 * * midgardNode is stored in table (determined by valid guid property)
		 * * midgardNode's parent property is 0
		 *
		 * @param session a {@link GICR.Session} to which node is associated
		 * @param midgardNode Midgard.Object of 'midgard_node' type which represents SQL record of the node
		 * @param parent a Node which is a parent for given node.
		 * A node is likely a root node if null given as parent
		 */
		public Node (Midgard2CR.Session session, Midgard.Object? midgardNode, Node? parent) {
			this.session = session;
			this.midgardNode = midgardNode;
			var up_prop_value = 0;	
			if (parent == null) {
				if (midgardNode != null) { 
					midgardNode.get ("parent", out up_prop_value);
					if (Midgard.is_guid (midgardNode.guid) && up_prop_value == 0) {
						this.isRoot = true;
					}
				}
			}
			this.parent = parent;
		}

		public Midgard.Object get_content_object () {
			if (this.contentObject == null)
				this.contentObject = Midgard.Object.factory (this.session.connection, 
					NameMapper.get_midgard_type_name (this.nodeType),
					"" );
			return this.contentObject;
		}

		/**
		 * Get Midgard node.
		 *
		 * First try to fetch object from database. If this fails, initialize empty new one.
		 * @return Midgard.Object of "midgard_node" type.
		 */
		public unowned Midgard.Object get_midgard_node () throws GICR.RepositoryException {
			if (this.midgardNode == null) {
				var up_id = 0;
				if (this.parent != null) 
					this.parent.midgardNode.get ("id", out up_id);
				this.midgardNode = this.internal_get_midgard_node (
					NameMapper.get_midgard_type_name (nodeType),
					this.get_name (),
					up_id);
				if (this.midgardNode == null) {
					this.midgardNode = Midgard.Object.factory (this.session.connection, "midgard_node", "");	
					this.midgardNode.set (
						"name", this.get_name (),
						"typename", NameMapper.get_midgard_type_name (nodeType)
					);
				}
			}
			return this.midgardNode;
		}

		public string get_type_name () {
			return this.nodeType;
		}		

		/*
		 * On demand fetch midgard node from database, or initialize new object */
		private unowned Midgard.Object? internal_get_midgard_node (string type, string name, uint up) throws GICR.RepositoryException {
			var qst = new Midgard.QueryStorage ("midgard_node");
                        var select = new Midgard.QuerySelect (this.session.connection, qst);
                        select.toggle_read_only (false);
			var group = new Midgard.QueryConstraintGroup ();
			group.add_constraint (
                                new Midgard.QueryConstraint (
                                        new Midgard.QueryProperty ("typename", null),
                                        "=",
                                        Midgard.QueryValue.create_with_value (type),
                                        null
                                )
                        );
			group.add_constraint (
                                new Midgard.QueryConstraint (
                                        new Midgard.QueryProperty ("name", null),
                                        "=",
                                        Midgard.QueryValue.create_with_value (name),
                                        null
                                )
                        );
			group.add_constraint (
                                new Midgard.QueryConstraint (
                                        new Midgard.QueryProperty ("parent", null),
                                        "=",
                                        Midgard.QueryValue.create_with_value (up),
                                        null
                                )
                        );
			select.set_constraint (group);
			try {
                        	select.execute ();
			} catch (Error e) {
				throw new GICR.RepositoryException.INTERNAL (e.message);
			}
                        if (select.resultscount == 0)
                                return null;
                        var objects = select.list_objects ();
                        return (Midgard.Object) objects[0];
		}

		private Node append_node (string name, string? primaryNodeTypeName) throws GICR.ItemExistsException, GICR.ConstraintViolationException, GICR.RepositoryException {
			/* Check if node has children with given name. If yes, throw exception */
			if (this.children != null
				&& this.children.has_key (name))
				throw new GICR.ItemExistsException.INTERNAL ("Node at path '%s/%s' exists ", this.get_path (), name);

			/* Handle empty NodeTypeName case */
			var nodeType = primaryNodeTypeName;
		
			var newNode = new Node (this.session, null, this);
			newNode.isNew = true;
			newNode.nodeType = nodeType;
			/* FIXME, enable when implemented 
			 * newNode.set_node_property ("jcr:primaryType", primaryNodeTypeName, PropertyType.NAME); */
			newNode.isModified = true;
			newNode.name = name;
			
			/* Set new node as a child of current one */
			if (this.children == null)
				this.children = new Gee.HashMap <string, Object>();	
			this.children[name] = newNode;

			return newNode;	
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Node add_node (string relPath, string? primaryNodeTypeName) throws GICR.ItemExistsException, GICR.PathNotFoundException, GICR.ConstraintViolationException, GICR.VersionException, GICR.LockException, GICR.InvalidArgumentException, GICR.RepositoryException {
			if (Path.is_absolute (relPath) == true) 
				throw new GICR.InvalidArgumentException.INTERNAL ("Expected relative path. Absolute one given");
			
			/* RepositoryException - If the last element of relPath has an index or if another error occurs. */
			if ("[" in relPath) 
				throw new GICR.RepositoryException.INTERNAL ("Index not allowed");

			if (primaryNodeTypeName == null) {
				/* TODO */
			}

			/* TODO */
			/* Validate primary node type */

			/* TODO */
			/* Check if property exists at the same path */

			/* TODO, */
			/* add nodes if there's a path with more than one element */

			return this.append_node (relPath, primaryNodeTypeName);
		}

		/**
		 * {@inheritDoc}
		 */
		public void order_before (string srcChildRelPath, string destChildRelPath) throws GICR.UnsupportedRepositoryOperationException, GICR.ConstraintViolationException, GICR.ItemNotFoundException, GICR.VersionException, GICR.LockException, GICR.InvalidArgumentException , GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		private void populate_properties (bool fromStorage) {
			if (this.properties == null)
				this.properties = new Gee.HashMap <string, Object>();
			
			if (fromStorage == false)
				return;

			if (this.properties != null)
				return;

			/* TODO, populate properties */
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Property set_node_property (string name, Value? val, int? type) throws GICR.ValueFormatException, GICR.VersionException, GICR.LockException, GICR.ConstraintViolationException, GICR.RepositoryException { 

			/* Initialize properties and populate available ones */
			this.populate_properties (true);
			/* Check if name is not a path */
			if (Path.has_separator (name)) 
				throw new GICR.ConstraintViolationException.INTERNAL ("Can not set property name with '/' separator");

			/* If Value is null, remove property */
			if (val == null) {
				/* TODO 
				 * get property definition
				 * check if property is protected - ConstraintViolationException
				 * check if property is mandatory - ConstraintViolationException
				 * remove property */
			}

			/* Validate property type */
			/* TODO
			 * From property definition, get required type.
			 * If defined, compare with given one.
			 * Throw ConstraintViolationException in case of mismateched */			

			/* Set property is basically setting value, so first try to get property.
			 * If it doesn't exist, create new one, and then set value */
			Midgard2CR.Property property = null;
			try {
				property = (Midgard2CR.Property) this.get_node_property (name);
			} catch (GICR.PathNotFoundException e) {
				property = new Property (this, name, null);		
			}
			property.set_value (val, type);
			this.properties[name] = (GLib.Object) property;
		
			/* We need property's flag to determine if property value has been changed.
			 If not, we should not mark node as modified one */
			this.isModified = true;
			
			return (GICR.Property) property;
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Node get_node (string relPath) throws GICR.PathNotFoundException, GICR.InvalidArgumentException, GICR.RepositoryException {
			if (Path.is_absolute (relPath)) 
				throw new GICR.RepositoryException.INTERNAL ("Expected relative path. Absolute '%s' given", relPath);
			populate_children ();
			string name = relPath.substring (0, relPath.index_of("/", 1)); 
			string remain = null;
			if ("/" in relPath)
				remain = relPath.substring (relPath.index_of("/", name.length)+1, -1);

			var child = this.children[name];
			if (child == null)
				throw new GICR.PathNotFoundException.INTERNAL ("Node at path '%s' not found", relPath);

			var childNode = new Node (this.session, (Midgard.Object) child, this);

			if (remain != null) 
				return childNode.get_node (remain);

			return childNode; 
		}

		private void populate_children () throws GICR.RepositoryException {
			/* Nothing to populate */
			if (this.children != null)
				return;

			/* This is initial, not yet stored node. Ignore. */
			if (Midgard.is_guid (this.get_midgard_node ().guid) == false)
				return;

			var propID = 0;
			this.get_midgard_node ().get ("id", out propID);

			if (propID == 0) {
				/* TODO, throw exception */
			}

			/* Query midgard_node and get children objects */
                        var qst = new Midgard.QueryStorage ("midgard_node");
                        var select = new Midgard.QuerySelect (this.session.connection, qst);
                        select.toggle_read_only (false);
                        select.set_constraint (
                                new Midgard.QueryConstraint (
                                        new Midgard.QueryProperty ("parent", null),
                                        "=",
                                        Midgard.QueryValue.create_with_value (propID),
                                        null
                                )
                        );
                        select.execute ();
			/* No children. Ignore. */
                        if (select.resultscount == 0)
                                return;

			/* Initialize children hash */
			this.children = new Gee.HashMap<string, GLib.Object> ();

                        Midgard.Object[] children = (Midgard.Object[]) select.list_objects ();

			foreach (weak Midgard.Object o in children) {
				string name;
				o.get ("name", out name);
				this.children[name] = (GLib.Object) o;
			}
			return;
		}

		private Node[]? internal_get_nodes (string[]? filter, bool fromStorage) throws GICR.RepositoryException {
			/* TODO filter */
			if (fromStorage == true)
				this.populate_children ();

			if (this.children == null || this.children.size == 0)
				return null;

			Node[] nodes = null;
			foreach (GLib.Object n in this.children.values) {
				nodes += (Midgard2CR.Node) n;
			}
			return nodes;
		}

		/**
		 * {@inheritDoc}
		 */
		public Node[] get_nodes (string[]? filter) throws GICR.RepositoryException { 
			return this.internal_get_nodes (filter, true);
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Property get_node_property (string relPath) throws GICR.PathNotFoundException, GICR.RepositoryException { 
			this.populate_properties (true);
			
			/* Check if relative path has been given.
			 * If yes, get node and then this node's property */
			if (Path.has_separator (relPath)) {
				/* TODO 
				 * split path 
				 return this.get_node (path).get_node_property (last_element); */
			}

			if (this.properties.has_key (relPath) == false) 
				throw new GICR.PathNotFoundException.INTERNAL ("Property '%s' not found", relPath);

			/* If there's property's key and value is not a Property object, create it */
			Property prop = (Midgard2CR.Property) this.properties[relPath];
			if (prop == null) {
				/* TODO
				 * Initialize Property object 
				 * set it as valueto corresponding key */
			}

			return (GICR.Property) prop;	
		}

		/**
		 * {@inheritDoc}
		 */
		public Value get_property_value (string name, int? type) throws GICR.PathNotFoundException, GICR.ValueFormatException, GICR.RepositoryException { 
			throw new GICR.RepositoryException.INTERNAL ("Not Supported");
		}

		private Property[] internal_get_properties (string[]? filter, bool fromStorage) throws GICR.RepositoryException {
			/* TODO add filter support */
			populate_properties (fromStorage);
		
			Property[] props = null;
			if (this.properties == null || this.properties.size == 0)
				return props;

			foreach (GLib.Object p in this.properties.values) {
				props += (Midgard2CR.Property) p;
			}
			return props;
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Property[] get_properties (string[]? filter) throws GICR.RepositoryException { 
			return (GICR.Property[]) this.internal_get_properties (filter, true);
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
			throw new GICR.ItemNotFoundException.INTERNAL ("Not Supported");
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
			throw new GICR.ConstraintViolationException.INTERNAL ("Not Supported");
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
			/* Root node so return "empty" path */
			if (this.isRoot == true)
				return "/";

			/* Parent node is root, append to path instance name only */
			if (this.parent == null)
				return "/" + this.get_name ();

			/* Chain up and build full path till root node is found */
			var path = this.parent.get_path () + "/" + this.get_name ();
			if (path[0] == '/' && path[1] == '/')
				return path.substring (1, -1);
			else 
				return path;
		}

		/**
		 * {@inheritDoc}
		 */
		public string get_name () throws GICR.RepositoryException {
			if (this.name == null) {
				this.name = "";
				if (this.isRoot == false)
					this.midgardNode.get ("name", out this.name);	
			}
			return this.name;
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
		public GICR.Node get_parent () throws GICR.RepositoryException, GICR.ItemNotFoundException, GICR.AccessDeniedException {
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
			return this.session;
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
			return this.isNew;
		}

		/**
		 * {@inheritDoc}
		 */
		public bool is_modified () {
			return this.isModified;
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

		private void internal_properties_save () throws GICR.AccessDeniedException, GICR.ItemExistsException, GICR.ConstraintViolationException, GICR.InvalidItemStateException, GICR.ReferentialIntegrityException, GICR.VersionException, GICR.LockException, GICR.NoSuchNodeTypeException, GICR.RepositoryException {
			Property[] props = internal_get_properties (null, false);
			foreach (weak Property p in props) {
				p.save ();
			}	
		}

		private void internal_node_create () throws GICR.RepositoryException {
			/* Create midgard_node first, so we can catch duplicate quickly */			
			if (this.parent != null) {
				var parentNode = this.parent.get_midgard_node ();
				uint propID;
				parentNode.get ("id", out propID);

				this.get_midgard_node ().set (
					"parentguid", parentNode.guid,
					"parent", propID
				);
				if (this.midgardNode.create () == false) {
					/* We have duplicate so silently return and do not create content object */
					if (this.session.connection.get_error () == Midgard.GenericError.DUPLICATE)
						return;
					throw new GICR.RepositoryException.INTERNAL (this.session.connection.get_error_string ());
				}
			}

			if (this.get_content_object ().create () == true) {
				/* If we crated content object, update midgard node and set correct reference guid 
				 * and type name */
				this.midgardNode.set (
					"typename", this.contentObject.get_type ().name (),
					"objectguid", this.contentObject.guid
				);
				this.midgardNode.update ();
			} else {
				throw new GICR.RepositoryException.INTERNAL (this.session.connection.get_error_string ());
			}
		}

		private void internal_node_update () throws GICR.RepositoryException {
			if (this.midgardNode.update () == true) 
				this.contentObject.update ();

			if (this.session.connection.get_error () != Midgard.GenericError.OK)
				throw new GICR.RepositoryException.INTERNAL (this.session.connection.get_error_string ());
		}

		private void internal_node_save () throws GICR.AccessDeniedException, GICR.ItemExistsException, GICR.ConstraintViolationException, GICR.InvalidItemStateException, GICR.ReferentialIntegrityException, GICR.VersionException, GICR.LockException, GICR.NoSuchNodeTypeException, GICR.RepositoryException {
			/* Remove node if flag indicates this */
			if (this.toRemove == true) {
				this.remove ();	
				return;
			}

                        /* Create Midgad node and content object */
			if (this.is_new () == true) 
				this.internal_node_create ();
			else /* Update Modgard node and content object */
				this.internal_node_update ();

			this.isNew = false;
			this.isModified = false;
			
			this.internal_properties_save (); 

			/* Get children and perform save */
                        Node[] children = (Midgard2CR.Node[]) this.internal_get_nodes (null, false);
                        foreach (weak Node n in children) {
                                n.internal_node_save ();
                        }
                }

		public void save () throws GICR.AccessDeniedException, GICR.ItemExistsException, GICR.ConstraintViolationException, GICR.InvalidItemStateException, GICR.ReferentialIntegrityException, GICR.VersionException, GICR.LockException, GICR.NoSuchNodeTypeException, GICR.RepositoryException {
			this.internal_node_save ();	
		}
	}
}
