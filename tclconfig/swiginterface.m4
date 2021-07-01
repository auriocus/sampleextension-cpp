#------------------------------------------------------------------------
# TEA_ADD_SWIGINTERFACE --
#
#	Specify one interface file which is processed by SWIG.
#	It is not important to specify the directory, as long as it is
#	in the generic, win or unix subdirectory of $(srcdir).
#
# Arguments:
#	one or more file names
#
# Results:
#
#	Defines and substs the following vars:
#		PKG_SOURCES
#		PKG_OBJECTS
#		SWIGINTERFACE
#		SWIGOUTPUT
#		SWIGOBJECT
#------------------------------------------------------------------------
AC_DEFUN([TEA_ADD_SWIGINTERFACE], [
		# check for SWIG
		AC_CHECK_PROG(SWIG_CHECK,swig,yes)
		AS_IF([test x"$SWIG_CHECK" != x"yes"], [AC_MSG_ERROR([Swig is requred to compile this.])])
		# check for existence - allows for generic/win/unix VPATH
		# To add more dirs here (like 'src'), you have to update VPATH
		# in Makefile.in as well
		
		SWIGINTERFACE=${srcdir}/$1
		if ! test -f "${SWIGINTERFACE}"; then
		  # check in generic
		  SWIGINTERFACE=${srcdir}/generic/$1
		  if ! test -f "${SWIGINTERFACE}"; then
		    # error
		    AC_MSG_ERROR([could not find SWIG interface file '$1'])
		  fi
		fi  
		PKG_SOURCES="$PKG_SOURCES $1"
		# this assumes it is in a VPATH dir
		SWIGBASE=${PACKAGE_NAME}_wrap
        SWIGOUTPUT=${srcdir}/generic/${SWIGBASE}.cpp
		# handle user calling this before or after TEA_SETUP_COMPILER
		if test x"${OBJEXT}" != x ; then
		    SWIGOBJECT="${SWIGBASE}.${OBJEXT}"
		else
		    SWIGOBJECT="${SWIGBASE}.\${OBJEXT}"
		fi
		PKG_OBJECTS="$PKG_OBJECTS $SWIGOBJECT"
    AC_SUBST(PKG_SOURCES)
    AC_SUBST(PKG_OBJECTS)
    AC_SUBST(SWIGOBJECT)
    AC_SUBST(SWIGOUTPUT)
    AC_SUBST(SWIGINTERFACE)
])

