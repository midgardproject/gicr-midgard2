NULL = 

ACLOCAL_AMFLAGS = -I m4

DISTCHECK_CONFIGURE_FLAGS = --enable-introspection

lib_LTLIBRARIES = libgicrmidgard2.la

AM_CFLAGS = \
	    -I$(top_srcdir)/src \
	    @GICR_MIDGARD2_CFLAGS@ \
	    $(GLIB_CFLAGS) 

AM_LDFLAGS = @GICR_MIDGARD2_LIBS@

midgard2cr_namespace = Midgard2CR

pkgdatadir = $(datadir)/gicr-midgard2
pkglibdir = $(libdir)/gicr-midgard2
libgicrmidgard2includedir = $(includedir)/gicr-midgard2
libgicrmidgard2include_HEADERS = $(top_srcdir)/src/gicr-midgard2.h

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = $(top_srcdir)/gicr-midgard2.pc

gicr_midgard2_header = $(top_srcdir)/src/gicr-midgard2.h
gicr_midgard2_vapi_file = Midgard2CR-1.0.vapi
gicr_midgard2_gir_file = Midgard2CR-1.0.gir

libgicrmidgard2_la_SOURCES = \
		     Repository.vala \
		     RepositoryFactory.vala \
		     Session.vala \
		     XMLImporter.vala \
		     XMLImporterFactory.vala \
		     XMLSystemViewImporter.vala \
		     XMLDocumentViewImporter.vala \
		     Node.vala \
		     Property.vala \
		     $(NULL)
			  
libgicrmidgard2_la_LDFLAGS = -module -export-dynamic @GICR_MIDGARD2_ABI_MAJOR@:0:0
libgicrmidgard2_la_LIBADD = @GICR_MIDGARD2_LIBS@ 

src_libgicrmidgard2_la_CPPFLAGS = \
			  -I$(top_srcdir)/src \
			  -DG_LOG_DOMAIN=\"$(midgard2cr_namespace)\"

VALAFLAGS = --vapi=$(gicr_midgard2_vapi_file) -H $(gicr_midgard2_header) --gir=$(gicr_midgard2_gir_file) --library gicr-midgard2 --pkg Midgard --pkg GICR-1.0 --pkg libxml-2.0 --pkg gee-1.0

CLEANFILES = \
	     $(gicr_midgard2_vapi_file) \
	     $(gicr__midgard2_header) \
	     libgicrmidgard2_la_vala.stamp \
	     $(libgicrmidgard2_la_SOURCES:.vala=.c) \
	     $(gicr_midgard2_gir_file) \
	     $(NULL)

EXTRA_DIST = \
	     $(gicr_midgard2_vapi_file) \
	     gicr-midgard2.pc.in \
	     m4/introspection.m4 \
	     $(NULL)

vapidir = $(datadir)/vala/vapi
vapi_DATA = \
	    $(top_srcdir)/src/$(gicr_midgard2_vapi_file) \
	    $(NULL)

-include $(INTROSPECTION_MAKEFILE)
INTROSPECTION_COMPILER_ARGS = --includedir=$(srcdir)

if HAVE_INTROSPECTION
INTROSPECTION_CFLAGS += $(AM_CFLAGS)
introspection_sources = $(libgicrmidgard2_la_SOURCES)
Midgard2CR-1.0.gir: $(lib_LTLIBRARIES)
Midgard2CR_1_0_gir_INCLUDES = GObject-2.0
Midgard2CR_1_0_gir_CFLAGS = $(AM_CFLAGS)
Midgard2CR_1_0_gir_LIBS = $(lib_LTLIBRARIES)
Midgard2CR_1_0_gir_FILES = $(addprefix $(srcdir)/,$(introspection_sources))
Midgard2CR_1_0_gir_PACKAGES = gobject-2.0 
introspection_file = $(gicr_midgard2_gir_file)
girdir = $(datadir)/gir-1.0
gir_DATA = $(introspection_file)

typelibsdir = $(libdir)/girepository-1.0
typelibs_DATA = $(introspection_file:.gir=.typelib)
CLEANFILES = $(dist_gir_DATA) $(typelibs_DATA)
endif

