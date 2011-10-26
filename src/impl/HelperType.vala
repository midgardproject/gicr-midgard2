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
	 * Helper to convert types between G type system and JCR PropertyType
	 */
	public abstract class HelperType : GLib.Object {

		public void register_transform_funcs () {
			
		}

		public abstract uint get_jcr_type (Type type);

		public abstract GLib.Type get_g_type (uint type);

		public abstract void to_string (Value src, out Value dest);
	}

	public class HelperTypeBinary : HelperType {
	
		public override GLib.Type get_g_type (uint Type) {
			return typeof (int);
		}

		public override uint get_jcr_type (Type type) {
			return GICR.PropertyType.UNDEFINED;
		}
	
		public override void to_string (Value src, out Value dest) {
			return;
		}
	}
}
