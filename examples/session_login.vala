
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
