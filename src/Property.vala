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

	/**
	 * {@inheritDoc}
	 */	
	public class Property : GLib.Object, GICR.Item, GICR.Property {

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_PRIMARY_TYPE = "{http://www.jcp.org/jcr/1.0}primaryType";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_MIXIN_TYPES = "{http://www.jcp.org/jcr/1.0}mixinTypes";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_CONTENT = "{http://www.jcp.org/jcr/1.0}content";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_DATA = "{http://www.jcp.org/jcr/1.0}data";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_PROTOCOL = "{http://www.jcp.org/jcr/1.0}protocol";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_HOST = "{http://www.jcp.org/jcr/1.0}host";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_PORT = "{http://www.jcp.org/jcr/1.0}port";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_REPOSITORY = "{http://www.jcp.org/jcr/1.0repository";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_WORKSPACE = "{http://www.jcp.org/jcr/1.0}workspace";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_PATH = "{http://www.jcp.org/jcr/1.0}path";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_ID = "{http://www.jcp.org/jcr/1.0}id";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_UUID = "{http://www.jcp.org/jcr/1.0}uuid";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_TITLE = "{http://www.jcp.org/jcr/1.0}title";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_DESCRIPTION = "{http://www.jcp.org/jcr/1.0}description";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_CREATED = "{http://www.jcp.org/jcr/1.0}created";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_CREATED_BY = "{http://www.jcp.org/jcr/1.0}createdBy";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_LAST_MODIFIED = "{http://www.jcp.org/jcr/1.0}lastModified";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_LAST_MODIFIED_BY = "{http://www.jcp.org/jcr/1.0}lastModifiedBy";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_LANGUAGE = "{http://www.jcp.org/jcr/1.0}language";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_MIMETYPE = "{http://www.jcp.org/jcr/1.0}mimeType";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_ENCODING = "{http://www.jcp.org/jcr/1.0}encoding";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_NODE_TYPE_NAME = "{http://www.jcp.org/jcr/1.0}nodeTypeName";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_SUPERTYPES = "{http://www.jcp.org/jcr/1.0}supertypes";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_IS_ABSTRACT = "{http://www.jcp.org/jcr/1.0}isAbstract";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_IS_MIXIN = "{http://www.jcp.org/jcr/1.0}isMixin";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_HAS_ORDERABLE_CHILD_NODES = "{http://www.jcp.org/jcr/1.0}hasOrderableChildNodes";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_PRIMARY_ITEM_NAME = "{http://www.jcp.org/jcr/1.0}primaryItemName";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_NAME = "{http://www.jcp.org/jcr/1.0}name";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_AUTOCREATED = "{http://www.jcp.org/jcr/1.0}autoCreated";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_MANDATORY = "{http://www.jcp.org/jcr/1.0}mandatory";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_PROTECTED = "{http://www.jcp.org/jcr/1.0}protected";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_ON_PARENT_VERSION = "{http://www.jcp.org/jcr/1.0}onParentVersion";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_REQUIRED_TYPE = "{http://www.jcp.org/jcr/1.0}requiredType";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_VALUE_CONSTRAINTS = "{http://www.jcp.org/jcr/1.0}valueConstraints";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_DEFAULT_VALUES = "{http://www.jcp.org/jcr/1.0}defaultValues";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_MULTIPLE = "{http://www.jcp.org/jcr/1.0}multiple";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_REQUIRED_PRIMARY_TYPES = "{http://www.jcp.org/jcr/1.0}requiredPrimaryTypes";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_DEFAULT_PRIMARY_TYPE = "{http://www.jcp.org/jcr/1.0}defaultPrimaryType";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_SAME_NAME_SIBLINGS = "{http://www.jcp.org/jcr/1.0}sameNameSiblings";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_LOCK_OWNER = "{http://www.jcp.org/jcr/1.0}lockOwner";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_LOCK_IS_DEEP = "{http://www.jcp.org/jcr/1.0}lockIsDeep";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_LIFECYCLE_POLICY = "{http://www.jcp.org/jcr/1.0}lifecyclePolicy";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_CURRENT_LIFECYCLE_STATE = "{http://www.jcp.org/jcr/1.0}currentLifecycleState";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_IS_CHECKED_OUT = "{http://www.jcp.org/jcr/1.0}isCheckedOut";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_FROZEN_PRIMARY_TYPE = "{http://www.jcp.org/jcr/1.0}frozenPrimaryType";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_FROZEN_MIXIN_TYPES = "{http://www.jcp.org/jcr/1.0}frozenMixinTypes";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_FROZEN_UUID = "{http://www.jcp.org/jcr/1.0}frozenUuid";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_VERSION_HISTORY = "{http://www.jcp.org/jcr/1.0}versionHistory";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_BASE_VERSION = "{http://www.jcp.org/jcr/1.0}baseVersion";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_PREDECESSORS = "{http://www.jcp.org/jcr/1.0}predecessors";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_MERGE_FAILED = "{http://www.jcp.org/jcr/1.0}mergeFailed";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_ACTIVITY = "{http://www.jcp.org/jcr/1.0}activity";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_CONFIGURATION = "{http://www.jcp.org/jcr/1.0}configuration";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_VERSIONABLE_UUID = "{http://www.jcp.org/jcr/1.0}versionableUuid";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_COPIED_FROM = "{http://www.jcp.org/jcr/1.0}copiedFrom";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_SUCCESSORS = "{http://www.jcp.org/jcr/1.0}successors";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_CHILD_VERSION_HISTORY = "{http://www.jcp.org/jcr/1.0}childVersionHistory";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_ROOT = "{http://www.jcp.org/jcr/1.0}root";

		/**
		 * {@inheritDoc}
		 */
		public const string JCR_STATEMENT = "{http://www.jcp.org/jcr/1.0}statement";

		/* Private members */
		private Midgard2CR.Session session = null;
		private GICR.Node parent = null;
		private bool isNew = false;
		private bool isModified = false;
		private Midgard.Object midgardProperty = null;

		public Property (Midgard2CR.Node parentNode, string name, Midgard.Object? midgardProperty) {
			if (midgardProperty == null) {
				this.midgardProperty = Midgard.Object.factory (((Midgard2CR.Session)parentNode.get_session ()).connection, "midgard_node_property", "");
				this.midgardProperty.set ("name", name);
				this.midgardProperty.set ("type", GICR.PropertyType.STRING); /* By default we set string type */
			} else {
				this.midgardProperty = midgardProperty;
			}
			this.parent = parentNode;	
		}

		/**
		 * {@inheritDoc}
		 */
		public void set_value (Value val, int type) throws GICR.ValueFormatException, GICR.VersionException, GICR.LockException, GICR.ConstraintViolationException, GICR.RepositoryException, GICR.InvalidArgumentException {
			/* Validate value - ValueFormatExcdeption */
			/* TODO, this.validateValue (val, type); */

			/* TODO */
			/* Check if property is registered.
			 * If it is, we need to validate if conversion follows the spec: "3.6.4 Property Type Conversion" */

			/* TODO */
			/* Handle multiple properties */
			this.midgardProperty.set (
				"value", val.get_string (),
				"type", type
			);
		}


		/**
		 * {@inheritDoc}
		 */
		public void set_values (ValueArray values, int type) throws GICR.ValueFormatException, GICR.VersionException, GICR.LockException, GICR.ConstraintViolationException, GICR.RepositoryException, GICR.InvalidArgumentException {
			throw new GICR.RepositoryException.INTERNAL ("Not supported");
		}			

		/**
		 * {@inheritDoc}
		 */
		public Value get_value () {
			throw new GICR.RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public ValueArray get_values () {
			throw new GICR.RepositoryException.INTERNAL ("Not supported");
		}


		/**
		 * {@inheritDoc}
		 */
		public string get_string () throws GICR.ValueFormatException, GICR.RepositoryException {
			string strval = "";
			this.midgardProperty.get ("value", out strval);
			return strval;
		}

		/**
		 * {@inheritDoc}
		 */
		public GLib.IOChannel get_binary () throws GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public long get_long () throws GICR.ValueFormatException, GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public float get_double () throws GICR.ValueFormatException, GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public double get_decimal () throws GICR.ValueFormatException, GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public DateTime get_date () throws GICR.ValueFormatException, GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public bool get_boolean () throws GICR.ValueFormatException, GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Node get_node () throws GICR.ValueFormatException, GICR.RepositoryException, GICR.ItemNotFoundException {
			throw new GICR.RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Property get_node_property () throws GICR.ValueFormatException, GICR.RepositoryException, GICR.ItemNotFoundException {
			throw new GICR.RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public long get_length () throws GICR.RepositoryException{
			throw new GICR.RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public long get_lengths () throws GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.PropertyDefinition get_definition () throws GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public int get_property_type () throws GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public bool is_multiple () throws GICR.RepositoryException {
			throw new GICR.RepositoryException.INTERNAL ("Not supported");
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
			return this.parent.get_session ();
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
