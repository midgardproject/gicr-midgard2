
using GICR;


/* Initialize repository and session */

void main () {

	/* Create entry to repository */
	stdout.printf ("Get repository \n");
	Repository repository = get_repository ();

	/* Create simple credentials with user's ID and password */
	var credentials = new SimpleCredentials ("admin", "password");	

	/* Create repository' session */
	stdout.printf ("Get session \n");
	Session session = repository.login (credentials, null);

	/* Get root node associated with session */
	GICR.Node rootNode = session.get_root_node ();
	stdout.printf ("Found root node at '%s' path \n", rootNode.get_path ());

	/* Add new node to root one and set new property */
	var newNode = rootNode.add_node ("ExampleNode", "nt:unstructured");

	/* Set string property */
	var newProperty = newNode.set_node_property ("ExampleProperty_STRING", "Hello example property!", GICR.PropertyType.STRING);
	stdout.printf ("New PropertyType.STRING : '%s' \n", newProperty.get_string ());
	
	/* Set long property */
	newProperty = newNode.set_node_property ("ExampleProperty_LONG", 123456, GICR.PropertyType.LONG);
	stdout.printf ("New PropertyType.LONG : '%ld' \n", newProperty.get_long ());

	/* Set bool property */
	newProperty = newNode.set_node_property ("ExampleProperty_BOOLEAN", false, GICR.PropertyType.BOOLEAN);
	stdout.printf ("New PropertyType.BOOLEAN : (%i) '%s' \n", (int) newProperty.get_boolean (), newProperty.get_string ());

	/* Set binary property */
	string binary_buffer;
        FileUtils.get_contents ("example_binary", out binary_buffer);
	newProperty = newNode.set_node_property ("ExampleProperty_BINARY", binary_buffer, GICR.PropertyType.BINARY);
	stdout.printf ("New PropertyType.BINARY : '%s' \n", newProperty.get_string ());
}


/* Implementation specific */

Repository get_repository () {

	Log.set_always_fatal (GLib.LogLevelFlags.LEVEL_WARNING);

	/* Read configuration file and pass it directly as repository configuration value */
	string config_buffer;
	FileUtils.get_contents ("midgard2.conf", out config_buffer);

	var parameters = new Gee.HashMap<string, string> ();
	parameters["midgard2.configuration.buffer"] = config_buffer;

	/* Create entry to repository */
        return Midgard2CR.RepositoryFactory.get_repository (parameters);
}
