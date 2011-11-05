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
		private Midgard2CR.Node parent = null;
		private bool isNew = true;
		private bool isModified = false;
		private Midgard.Object[] midgardProperty = null;
		private bool isMultiple = false;
		private ValueArray values = null;
		private string name = null;
		private uint type = 0;		

		public Property (Midgard2CR.Node parentNode, string name, Midgard.Object? midgardProperty) {
			if (midgardProperty != null) {
				this.midgardProperty += (Midgard.Object) midgardProperty.ref ();
				if (Midgard.is_guid (midgardProperty.guid) == false)
					this.isNew = true;
			}
			this.name = name;
			this.parent = parentNode;	
		}

		private Midgard.Object[]? get_midgard_properties () throws GICR.RepositoryException {
			if (this.midgardProperty == null) {
			/* TODO, fetch properties from db */
				//this.isNew = false;
			}
			if (this.midgardProperty != null) 
				return this.midgardProperty;

			if (this.values == null)
				return null;				

			foreach (Value v in this.values) {
				Midgard.Object prop = Midgard.Object.factory (
					((Midgard2CR.Session)this.get_session ()).connection, 
					"midgard_node_property", ""
				);
				Value strv = Value (typeof(string));
				v.transform (ref strv);
				prop.set (
					"title", name,
					"type", this.type == 0 ? GICR.PropertyType.STRING : this.type,
					"value", strv.get_string ()
				);
				this.midgardProperty += prop;	
				this.isNew = true;
			}
			return this.midgardProperty;	
		}

		private ParamSpec get_property_spec () throws GICR.RepositoryException {
			Type klassType = Type.from_name (NameMapper.get_midgard_type_name (this.parent.get_type_name ()));
			return ((ObjectClass) klassType.class_peek ()).
				find_property (NameMapper.get_midgard_property_name (this.get_name ()));
		}

		private void set_internal_values (Value val, bool append) throws GICR.RepositoryException {
			if (this.get_property_spec () != null) {
	
				this.parent.get_content_object ().set_property (
					NameMapper.get_midgard_property_name (this.get_name ()), 
					val 
				);
				return; 
			}
			
			if (this.values == null)
				this.values = new ValueArray (0);			

			/* In case of multivalue property append one */
			if (append == false) 
				this.values.insert (0, val);
			else 
				this.values.append (val);
		}

		private unowned ValueArray get_internal_values () throws GICR.RepositoryException {
			if (this.values == null)
				this.values = new ValueArray (1);
			var pspec = this.get_property_spec ();
			if (pspec != null) {
				Value val = {};
				val.init (pspec.value_type);
				this.parent.get_content_object ().get_property (NameMapper.get_midgard_property_name (this.get_name ()), ref val);
				this.values.append (val);
			}
			return this.values;	
		}
		
		/**
		 * {@inheritDoc}
		 */
		public void set_value (Value val, int type) throws GICR.ValueFormatException, GICR.VersionException, GICR.LockException, GICR.ConstraintViolationException, GICR.RepositoryException {
			this.append_internal_value (val, type, this.is_multiple ());
			this.isModified = true;
		}

		private void append_internal_value (Value val, int type, bool append) throws GICR.ValueFormatException, GICR.VersionException, GICR.LockException, GICR.ConstraintViolationException, GICR.RepositoryException {

			/* Validate value - ValueFormatException */
			/* TODO, this.validateValue (val, type); */

			/* TODO */
			/* Check if property is registered.
			 * If it is, we need to validate if conversion follows the spec: "3.6.4 Property Type Conversion" */	

			/* TODO */
			/* Handle multiple properties */

			Value newValue = {};
			newValue.init (typeof (string));

			int propertyType = type;
			if (val.holds (typeof (Object)) == true) {
				/* Value holds Node */
				Object valueObject = val.get_object ();
				if (valueObject is GICR.Node) {
					if (type == 0) {
						propertyType = GICR.PropertyType.REFERENCE;
					}
					try {
						newValue.set_string (((GICR.Node)valueObject).get_node_property ("jcr:uuid").get_string());
					} catch (GICR.PathNotFoundException e) {
						throw new GICR.RepositoryException.INTERNAL (e.message);
					}
				}
				/* Value is a Property */
				if (valueObject is GICR.Property) {
					newValue.set_string (((GICR.Property)valueObject).get_string ());
				}
			/* Value holds DateTime */
			} else if (val.holds (typeof (GLib.DateTime))) {
				
			} else {
				val.transform (ref newValue);
			}
			
			/* TODO */
			/* Set default type if none specified */
			this.type = propertyType;	
			this.set_internal_values (newValue, false);			
		}

		/**
		 * {@inheritDoc}
		 */
		public void set_values (ValueArray values, int type) throws GICR.ValueFormatException, GICR.VersionException, GICR.LockException, GICR.ConstraintViolationException, GICR.RepositoryException {
			/* TODO, determine if this property may hold multiple values */
			if (this.values != null && this.values.n_values > 0)
				this.values = null;
			foreach (Value val in values) {
				this.append_internal_value (val, type, true);
			}	
		}			

		/* TODO
		 * get_value () and get_values () could return owned values to improve performance.
		 * Application should then copy value(s) if needed. 
		 */ 

		/**
		 * {@inheritDoc}
		 */
		public Value get_value () throws GICR.ValueFormatException, GICR.RepositoryException {
			if (this.is_multiple () == true)
				throw new GICR.ValueFormatException.INTERNAL ("Can not get single value of multi valued property");
		
			unowned ValueArray values = get_internal_values ();	
			if (values != null)
				return values.values[0];

			throw new GICR.RepositoryException.INTERNAL ("Can not access value. Holder not initialized");
		}

		/**
		 * {@inheritDoc}
		 */
		public ValueArray get_values () throws GICR.ValueFormatException, GICR.RepositoryException {
			if (this.is_multiple () == false)
				throw new GICR.ValueFormatException.INTERNAL ("Can not get values of single valued property");
			
			if (this.values != null)
				return this.values.copy ();

			throw new GICR.RepositoryException.INTERNAL ("Can not access values. Holder not initialized");	
		}


		/**
		 * {@inheritDoc}
		 */
		public string get_string () throws GICR.ValueFormatException, GICR.RepositoryException {
			if (this.is_multiple () == true)
				throw new GICR.ValueFormatException.INTERNAL ("Can not get value of multi valued property");	
			var val = this.get_value ();
			Value strval = {};
			strval.init (typeof (string));
			val.transform (ref strval);
			return strval.get_string ();
		}

		/**
		 * {@inheritDoc}
		 */
		public GLib.DataInputStream get_binary () throws GICR.ValueFormatException, GICR.RepositoryException {
			if (this.is_multiple () == true)
				throw new GICR.ValueFormatException.INTERNAL ("Can not get value of multi valued property");
			GLib.InputStream inputStream = new MemoryInputStream.from_data (this.values.values[0].get_string ().data, GLib.g_free);
			return new DataInputStream (inputStream);
		}

		/**
		 * {@inheritDoc}
		 */
		public long get_long () throws GICR.ValueFormatException, GICR.RepositoryException {
			if (this.is_multiple () == true)
				throw new GICR.ValueFormatException.INTERNAL ("Can not get value of multi valued property");
			return long.parse (this.get_string ());
		}

		/**
		 * {@inheritDoc}
		 */
		public double get_double () throws GICR.ValueFormatException, GICR.RepositoryException {
			if (this.is_multiple () == true)
				throw new GICR.ValueFormatException.INTERNAL ("Can not get value of multi valued property");
			return double.parse (this.get_string ());
		}

		/**
		 * {@inheritDoc}
		 */
		public float get_float () throws GICR.ValueFormatException, GICR.RepositoryException {
			if (this.is_multiple () == true)
				throw new GICR.ValueFormatException.INTERNAL ("Can not get value of multi valued property");
			throw new GICR.RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public DateTime get_date () throws GICR.ValueFormatException, GICR.RepositoryException {
			if (this.is_multiple () == true)
				throw new GICR.ValueFormatException.INTERNAL ("Can not get value of multi valued property");
			throw new GICR.RepositoryException.INTERNAL ("Not supported");
		}

		/**
		 * {@inheritDoc}
		 */
		public bool get_boolean () throws GICR.ValueFormatException, GICR.RepositoryException {
			if (this.is_multiple () == true)
				throw new GICR.ValueFormatException.INTERNAL ("Can not get value of multi valued property");
			return bool.parse (this.get_string ());
		}

		/**
		 * {@inheritDoc}
		 */
		public GICR.Node get_node () throws GICR.ValueFormatException, GICR.RepositoryException, GICR.ItemNotFoundException {
			if (this.is_multiple () == true)
				throw new GICR.ValueFormatException.INTERNAL ("Can not get value of multi valued property");

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
		public uint get_property_type () throws GICR.RepositoryException {
			return this.type;
		}

		/**
		 * {@inheritDoc}
		 */
		public bool is_multiple () throws GICR.RepositoryException {
			/* Either set explicitly by property definition or property holds value array */
			if (this.isMultiple == true)
				return true;
			
			/* TODO
			 * Check  property definition*/

			/* Check midgard node_property flag */
			
			/* finally return false */
			return false; 
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
			return this.parent;
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
			if (this.session == null)
				this.session = (Midgard2CR.Session) this.parent.get_session ();
			return (GICR.Session) this.session;
		}

		/**
		 * {@inheritDoc}
		 */
		public bool is_node () {
			return false;
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

		private void internal_property_create () throws GICR.RepositoryException {
			Midgard.Object[] props = get_midgard_properties ();
			if (props == null)
				return;
					foreach (Midgard.Object p in props) {
				var parentID = 0;
				this.parent.get_content_object ().get ("id", out parentID);
				p.set (
					"parent", parentID, 
					"parentguid", this.parent.get_content_object ().guid,
					"type", this.type	
				);
				p.create ();
				/* TODO ,create attachment in case of binary property */
			} 	
		}

		private void internal_property_update () throws GICR.RepositoryException {
			//if (this.get_midgard_property ().update() == false)
			//	throw new GICR.RepositoryException.INTERNAL (this.get_session ().connection.get_error_string ());
		}

		private void internal_property_save () throws GICR.RepositoryException {
			if (this.is_new () == true)
				internal_property_create ();
			else 
				internal_property_update ();
	
			this.isNew = false;
			this.isModified = false;
		}

		public void save () throws GICR.AccessDeniedException, GICR.ItemExistsException, GICR.ConstraintViolationException, GICR.InvalidItemStateException, GICR.ReferentialIntegrityException, GICR.VersionException, GICR.LockException, GICR.NoSuchNodeTypeException, GICR.RepositoryException {
			internal_property_save ();
		}

		public void set_multiple_flag (bool flag) {
			this.isMultiple = flag;
		}
	}
}
