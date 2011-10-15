/* 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation {
			throw new GICR.RepositoryException.INTERNAL("Not supported");
		} either version 2 of the License, or
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

	/**
	 * {@inheritDoc}
 	 */
	public abstract class Item : GLib.Object, GICR.Item {

		protected GICR.Session session = null;
		protected GICR.Node parent = null;

		/**
		 *{@inheritDoc}
		 */		
		public string get_path () throws GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL("Not supported");
		}

		/**
		 *{@inheritDoc}
		 */
		public string get_name () throws GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL("Not supported");
		}

		/**
		 *{@inheritDoc}
		 */
		public Item get_ancestor (int depth) throws GICR.RepositoryException, GICR.ItemNotFoundException, GICR.AccessDeniedException {
			throw new GICR.RepositoryException.INTERNAL("Not supported");
		}

		/**
		 *{@inheritDoc}
		 */
		public Item get_parent () throws GICR.RepositoryException, GICR.ItemNotFoundException, GICR.AccessDeniedException {
			throw new GICR.RepositoryException.INTERNAL("Not supported");
		}

		/**
		 *{@inheritDoc}
		 */
		public int get_depth () throws GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL("Not supported");
		}

		/**
		 *{@inheritDoc}
		 */
		public Session get_session () throws GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL("Not supported");
		}

		/**
		 *{@inheritDoc}
		 */
		public bool is_node ();

		/**
		 *{@inheritDoc}
		 */
		public abstract bool is_new ();

		/**
		 *{@inheritDoc}
		 */
		public abstract bool is_modified ();

		/**
		 *{@inheritDoc}
		 */
		public bool is_same (Item other_item) throws GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL("Not supported");
		}

		/**
		 *{@inheritDoc}
		 */
		public void refresh (bool keep_changes) throws GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL("Not supported");
		}

		/**
		 *{@inheritDoc}
		 */
		public void remove () throws GICR.RepositoryException, GICR.VersionException, GICR.LockException, GICR.ConstraintViolationException, GICR.AccessDeniedException {
			throw new GICR.RepositoryException.INTERNAL("Not supported");
		}
	}
}
