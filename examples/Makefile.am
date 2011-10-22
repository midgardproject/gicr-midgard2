NULL =

AM_CFLAGS =                             \
	-I ../src/	                \
	$(GLIB_CFLAGS)                  \
	$(LIBGEE_CFLAGS)                \
	$(LIBVALA_CFLAGS)               \
	$(MIDGARD_CFLAGS)		\
	$(GICR_CFLAGS)			\
	$(LIBXML2_CFLAGS)		\
	$(NULL)


bin_PROGRAMS = session-login 
bin_PROGRAMS += session-import
bin_PROGRAMS += node-property

BUILT_SOURCES = session_login.vala.stamp 
BUILT_SOURCES += session_import.vala.stamp
BUILT_SOURCES += node_property.vala.stamp

session_login_VALASOURCES = \
			    session_login.vala \
			    $(NULL)

session_import_VALASOURCES = \
		     	     session_import.vala \
			     $(NULL)

node_property_VALASOURCES = \
		     	     node_property.vala \
			     $(NULL)
session_login_SOURCES = \
			$(session_login_VALASOURCES:.vala=.c) \
			$(NULL)
	
session_import_SOURCES = \
			$(session_import_VALASOURCES:.vala=.c) \
			$(NULL)

node_property_SOURCES = \
			$(node_property_VALASOURCES:.vala=.c) \
			$(NULL)
common_LDADD =			\
	../src/libgicrmidgard2.la	\
	$(GLIB_LIBS)                	\
	$(LIBVALA_LIBS)             	\
	$(MIDGARD_LIBS) 	    	\
	$(GICR_LIBS)		    	\
	$(LIBGEE_LIBS)			\
	$(NULL)

session_login_LDADD = $(common_LDADD) 
session_import_LDADD = $(common_LDADD) 
node_property_LDADD = $(common_LDADD) 

common_VALA_COMMAND = $(VALAC) -C --pkg Midgard2CR-1.0 --pkg GICR-1.0 --pkg gee-1.0 --pkg libxml-2.0 --pkg Midgard --pkg gio-2.0 --vapidir $(top_srcdir)/src/ $^ 

session_login.vala.stamp: $(session_login_VALASOURCES)
	$(common_VALA_COMMAND)
	touch @

session_import.vala.stamp: $(session_import_VALASOURCES)
	$(common_VALA_COMMAND)
	touch @

node_property.vala.stamp: $(node_property_VALASOURCES)
	$(common_VALA_COMMAND)
	touch @

EXTRA_DIST = \
	     $(session_login_VALASOURCES)  session_login.vala.stamp \
	     $(session_import_VALASOURCES)  session_import.vala.stamp \
	     $(node_property_VALASOURCES)  node_property.vala.stamp \     
	     $(NULL)

MAINTAINERCLEANFILES =              \
	$(session_login_VALASOURCES:.vala=.c) \
	$(session_login_VALASOURCES:.vala=.h) \
	$(session_import_VALASOURCES:.vala=.c) \
	$(session_import_VALASOURCES:.vala=.h) \
	$(node_property_VALASOURCES:.vala=.c) \
	$(node_property_VALASOURCES:.vala=.h) \
	$(NULL)
