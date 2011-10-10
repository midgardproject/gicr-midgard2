
using GICR;
using Midgard;

namespace GICRMidgard {

	/**
	 * {@inheritDoc}
	 */
	public class Repository : GLib.Object, GICR.Repository {

		/**
		 * {@inheritDoc}
		 */
		public Session login (Credentials credentials, string? workspace_name) throws RepositoryException {

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

