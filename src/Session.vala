
using GICR;

namespace Midgard2CR {

	/**
	 * {@inheritDoc}
	 */
	public class Session : GLib.Object, GICR.Session {

		private Repository repository = null;
		private string userID = null;
		private Workspace workspace = null;
		private Node rootNode = null;
		private Midgard.User user = null;
		private Midgard.Object rootObject = null;
		private GICR.Credentials credentials = null;
		private bool isAnonymous = true;

		public Midgard.Connection connection {get; construct;}

		/**
		 *
		 */
		public Session (Midgard.Connection cnc, Repository repository, Midgard.User? user, Midgard.Object rootObject, GICR.Credentials? crds) {
			GLib.Object (connection: cnc);
			this.repository = repository;
			this.user = user;
			this.rootObject = rootObject;
			this.credentials = crds;

			if (crds != null)
				this.isAnonymous = false;
		}

		/**
		 * {@inheritDoc} 
		 */
		public GICR.Repository get_repository () {
			return this.repository;
		}

		/**
		 * {@inheritDoc}
		 */
		public string? get_user_id () {
			return this.userID;
		}

		/**
		 * {@inheritDoc}
		 */
		public string[] get_attribute_names () {
			/* FIXME */
			return {};
		}

		/**
		 * {@inheritDoc}
		 */
		public Value? get_attribute (string name) {
			return null;
		}

		/**
		 * {@inheritDoc}
		 */
		public Workspace get_workspace () {
			return this.workspace;
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Node get_root_node () {
			if (this.rootNode == null) {
				this.rootNode = new Node (this, this.rootObject, null);
			}
			
			return (this.rootNode as GICR.Node);
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Session impersonate (GICR.Credentials credentials) throws LoginException, RepositoryException {
			throw new LoginException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Node get_node_by_identifier (string id) throws RepositoryException {
			throw new RepositoryException.INTERNAL ("Not supported");	
		}

		/**
		 * {@inheritDoc}
		 */
		public Item get_item (string absPath) throws RepositoryException, PathNotFoundException {
			try {
				return 	this.get_node (absPath);
			} catch (PathNotFoundException e) {
				return this.get_node_property (absPath);
			}
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Node get_node (string absPath) throws RepositoryException, PathNotFoundException {
			var rNode = this.get_root_node ();		
			if (absPath == "/")
				return rNode;
			try {
				return rNode.get_node (Path.is_absolute (absPath) ? absPath.substring (1, -1) : absPath);
			} catch (GICR.InvalidArgumentException e) {
				throw new GICR.RepositoryException.INTERNAL (e.message);
			}
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Property get_node_property (string absPath) throws RepositoryException, PathNotFoundException {
			return this.get_root_node ().get_node_property (Path.get_relative (absPath));
		}

		/**
		 * {@inheritDoc}
		 */
		public bool item_exists (string absPath) throws RepositoryException {
			return this.node_exists (absPath) == true ? true : this.property_exists (absPath);
		}

		/**
		 * {@inheritDoc}
		 */
		public bool node_exists (string absPath) throws RepositoryException {
			/* TODO OPTIMIZE */
			try {
				this.get_node (absPath);
				return true;
			} catch (GICR.PathNotFoundException e) {
				return false;
			}
		}

		/**
		 * {@inheritDoc}
		 */
		public bool property_exists (string absPath) throws RepositoryException {
			/* TODO OPTIMIZE */
			try {
				this.get_node_property (absPath);
				return true;
			} catch (GICR.PathNotFoundException e) {
				return false;
			}
		}

		/**
		 * {@inheritDoc}
		 */
		public void move (string srcAbsPath, string destAbsPath) throws RepositoryException, PathNotFoundException, ItemExistsException, VersionException, ConstraintViolationException, LockException {
			throw new RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public void remove_item (string absPath) throws VersionException, LockException, ConstraintViolationException, PathNotFoundException, RepositoryException {
			throw new RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public void save () throws GICR.AccessDeniedException, GICR.ItemExistsException, GICR.ConstraintViolationException, GICR.InvalidItemStateException, GICR.ReferentialIntegrityException, GICR.VersionException, GICR.LockException, GICR.NoSuchNodeTypeException, GICR.RepositoryException {
			
			/* TODO, remove nodes marked to be removed */

			Node rootNode = (Midgard2CR.Node) this.get_root_node ();
			rootNode.save ();
		}

		/**
		 * {@inheritDoc}
		 */
		public void refresh (bool keepChanges) throws RepositoryException {
			throw new RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public bool has_pending_changes () throws RepositoryException {
			throw new RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public bool has_permission (string absPath, string[] actions) throws RepositoryException {
			throw new RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public void check_permission (string absPath, string[] actions) throws RepositoryException, AccessControlException {
			throw new RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public bool has_capability (string methodName, Value target, ValueArray arguments) throws RepositoryException {
			throw new RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public void import_xml (string parentAbsPath, string uri, int uuidBehavior) throws RepositoryException, RuntimeException, PathNotFoundException, ItemExistsException, ConstraintViolationException, VersionException, InvalidSerializedDataException, LockException {
			XMLImporter importer = XMLImporterFactory.create_importer_from_file (this, parentAbsPath, uuidBehavior, uri);
			try {
				importer.execute ();
			} catch (GICR.ValueFormatException e) {
				throw new GICR.RepositoryException.INTERNAL (e.message);
			} catch (GICR.InvalidArgumentException e) {
				throw new GICR.RepositoryException.INTERNAL (e.message);
			}
		}

		/**
		 * {@inheritDoc}
		 */
		public void export_system_view (string absPath, GLib.IOChannel stream, bool skipBinary, bool noRecurse) throws RepositoryException, PathNotFoundException,RuntimeException {
			throw new RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public void export_document_view (string absPath, GLib.IOChannel stream, bool skipBinary, bool noRecurse) throws PathNotFoundException, RuntimeException, RepositoryException  {
			throw new RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public void set_namespace_prefix (string prefix, string uri) throws NamespaceException, RepositoryException {
			throw new RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public string[] get_namespace_prefixes () throws RepositoryException {
			throw new RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public string get_namespace_uri (string prefix) throws RepositoryException, NamespaceException {
			throw new RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public string get_namespace_prefix (string uri) throws RepositoryException, NamespaceException {
			throw new RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public void logout () {
			throw new RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public bool is_live () {
			throw new RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public AccessControlManager get_access_control_manager () throws RepositoryException, UnsupportedRepositoryOperationException {
			throw new RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public RetentionManager get_retention_manager () throws RepositoryException, UnsupportedRepositoryOperationException {
			throw new RepositoryException.INTERNAL ("Not supported");	
		}
	}
}

