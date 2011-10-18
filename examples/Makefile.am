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

BUILT_SOURCES = session_login.vala.stamp

session_login_VALASOURCES = \
	session_login.vala      \
    $(NULL)

session_login_SOURCES = \
	$(session_login_VALASOURCES:.vala=.c) \
	$(NULL)
	
session_login_LDADD =			\
	../src/libgicrmidgard2.la	 \
	$(GLIB_LIBS)                	\
	$(LIBVALA_LIBS)             	\
	$(MIDGARD_LIBS) 	    	\
	$(GICR_LIBS)		    	\
	$(LIBGEE_LIBS)			\
	$(NULL)

session_login.vala.stamp: $(session_login_VALASOURCES)
	$(VALAC) -C --pkg Midgard2CR-1.0 --pkg GICR-1.0 --pkg gee-1.0 --pkg libxml-2.0 --pkg Midgard --pkg gio-2.0 --vapidir $(top_srcdir)/src/ $^
	touch $@

EXTRA_DIST = $(session_login_VALASOURCES)  session_login.vala.stamp 

MAINTAINERCLEANFILES =              \
	$(session_login_VALASOURCES:.vala=.c) \
	$(session_login_VALASOURCES:.vala=.h) \
	$(NULL)

