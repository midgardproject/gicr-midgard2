
using GICR;
using Midgard;

namespace Midgard2CR {

	/**
	 * {@inheritDoc}
	 */
	public class Repository : GLib.Object, GICR.Repository {

		private Midgard.Connection connection = null;

		public Repository (Gee.HashMap? parameters) throws Error {
			GLib.Object ();
			this.connection = this.midgard2_connect (parameters);
		}

		private Midgard.Connection midgard2_connect (Gee.HashMap <string, string>parameters) throws Error {
			if (this.connection != null)
				return this.connection;

			/* Initialie Midgard types */
			Midgard.init ();

			/* Check if given parameters has configuration buffer.
			 * It doesn't make sens to read and set every single config property.
			 * Repository initialization part should be responsible for config.
			 * So, initialize config and read it's content from given buffer. 
			 */
			var config = new Midgard.Config();
			string configBuffer = parameters.get ("midgard2.configuration.buffer");
			if (configBuffer != null) 
				config.read_data (configBuffer);
								
			/* Initialize Midgard.Connection.
			 * If no buffer has been set for config, default values will be used 
			 */
			this.connection = new Midgard.Connection ();
			this.connection.open_config (config);

			/* Initialize underlying storage. */ 			 
			this.initialize_storage (config, this.connection);

			return this.connection;
		}

		private void initialize_type_storage (Midgard.Connection cnc, Midgard.Config config, string typename) throws Error {
			/* Create or update storage for every given and derived derived type */
			Type[] children = Type.from_name (typename).children();
			foreach (var t in children) {
				/* Ignore abstract types and interfaces */
				if (t.is_abstract()
					|| t.is_interface()) {
					initialize_type_storage (cnc, config, t.name ());
					continue;
				}
				/* If TableCreate is true, create tables for all available types */
				if (config.tablecreate == true)
					Midgard.Storage.create (cnc, t.name());
				/* If Tableupdate is true, update tables */
				if (config.tableupdate == true)
					Midgard.Storage.update (cnc, t.name());
	
				/* Initialize storage for every derived type */
				initialize_type_storage (cnc, config, t.name ());
			}
		} 

		private void initialize_storage (Midgard.Config config, Midgard.Connection cnc) throws Error {

			Midgard.Storage.create_base_storage (cnc);
			
			/* Create or update storage for every Midgard.DBObject derived type */
			initialize_type_storage (cnc, config, "MidgardDBObject");

			/* Try to get root node */
			var rootNode = this.get_root_object (cnc);
			if (rootNode != null)
				return;

			/* If it's not there, create it */
			var node = Midgard.Object.factory (cnc, "midgard_node", "");
			node.set_property ("parent", 0);
			node.set_property ("name", "Midgard2CR Root Node");
			node.create ();
		}

		private Midgard.Object? get_root_object (Midgard.Connection cnc) throws Error {
			/* Query midgard_node table and check if there's already root node */
			var qst = new Midgard.QueryStorage ("midgard_node");
			var select = new Midgard.QuerySelect (cnc, qst);
			select.set_constraint (
				new Midgard.QueryConstraint (
					new Midgard.QueryProperty ("parent", null),
					"=",
					Midgard.QueryValue.create_with_value (0),
					null
				)
			);
			select.execute ();
			if (select.resultscount == 0)
				return null;
			var objects = select.list_objects ();
			return (Midgard.Object) objects[0];
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Session login (GICR.Credentials credentials, string? workspace_name) throws RepositoryException {
			/* TODO, initialize user */
			Midgard.User user = null;
			Midgard.Object rootObject = null; 
			try {
				rootObject = this.get_root_object (this.connection);
			} catch (Error e) {
				throw new RepositoryException.INTERNAL (e.message);
			}
			/* TODO, set Workspace */
			/* We use connection's copy for a session.
			 * If there are multiple sessions per repository, each is using own connection */
			return new Midgard2CR.Session (this.connection.copy (), this, user, rootObject, credentials);
		}

		/**
		 * {@inheritDoc}
		 */
		public string[] get_descriptor_keys () {
			/* TODO */
			return {"FIX", "ME"};
		}

		/**
		 * {@inheritDoc}
		 */
		public bool is_standard_descriptor (string key) {
			/* TODO */
			return false;
		}
		
		/**
		 * {@inheritDoc} 
		 */
		public Value get_descriptor (string key) {
			/* TODO */
			return 	"";				
		}
	}		
}

