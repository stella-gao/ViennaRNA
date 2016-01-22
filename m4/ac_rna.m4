# This file is part of Autoconf.                       -*- Autoconf -*-

# ViennaRNA Package 2011 Ronny Lorenz
#

##----------------##
## Public macros. ##
##----------------##

AC_DEFUN([AC_RNA_INIT],[

AX_COMPILER_VENDOR
AC_CANONICAL_HOST

AC_CHECK_PROG(PERL,perl,perl)

##------------------##
## Enable Features  ##
##------------------##

RNA_ENABLE_LTO
RNA_ENABLE_SVM
RNA_ENABLE_JSON
RNA_ENABLE_GSL
RNA_ENABLE_OPENMP
RNA_ENABLE_BOUSTROPHEDON
RNA_ENABLE_GEN_HC
RNA_ENABLE_FLOATPF
RNA_ENABLE_DEPRECATION_WARNINGS

## Set post conditions for feature
## settings

RNA_FEATURE_POST

##--------------------##
## Enable Subpackages ##
##--------------------##

RNA_ENABLE_PKG_KINFOLD
RNA_ENABLE_PKG_FORESTER
RNA_ENABLE_PKG_CLUSTER

##--------------------##
## Enable scripting   ##
## language interface ##
##--------------------##

RNA_ENABLE_SWIG_INTERFACES

##------------------##
## Enable Reference ##
## Manual           ##
##------------------##

RNA_ENABLE_DOXYGEN_REFMAN([RNAlib])

##--------------------##
## Enable Unit tests  ##
##--------------------##
RNA_ENABLE_UNIT_TESTS


##------------------##
## Prepare files    ##
##------------------##

AC_CONFIG_FILES([misc/Makefile misc/ViennaRNA.spec misc/PKGBUILD])
AC_CONFIG_FILES([interfaces/Makefile])
AC_CONFIG_FILES([Makefile RNAlib2.pc src/Utils/Makefile src/bin/Makefile src/Makefile man/Makefile src/ViennaRNA/Makefile doc/Makefile])
AC_CONFIG_FILES([man/cmdlopt.sh],[chmod +x man/cmdlopt.sh])

])

AC_DEFUN([AC_RNA_NOTICE],[

# get directory paths

eval _bindir=$(eval printf "%s" $bindir)
eval _libdir=$(eval printf "%s" $libdir)
eval _includedir=$(eval printf "%s" $includedir)
eval _datadir=$(eval printf "%s" $datadir)
eval _mandir=$(eval printf "%s" $mandir)
eval _docdir=$(eval printf "%s" $docdir)
eval _htmldir=$(eval printf "%s" $htmldir)
eval _pdfdir=$(eval printf "%s" $pdfdir)

# Notify the user

AC_MSG_NOTICE([

Configured successful with the following options:

RNAlib Scripting Interfaces:
  Perl Interface:           ${with_perl:-yes}       $enabled_but_failed_perl
  Python Interface:         ${with_python:-yes}     $enabled_but_failed_python

Extra Programs:
  Analyse{Dists,Seqs}:      ${with_cluster:-no}
  Kinfold:                  ${with_kinfold:-yes}
  RNAforester:              ${with_forester:-yes}

Other Options:
  SVM:                      ${with_svm:-yes}
  JSON:                     ${with_json:-yes}
  GSL:                      ${with_gsl:-yes}        $enabled_but_failed_gsl
  Boustrophedon:            ${enable_boustrophedon:-yes}
  Generic Hard Constraints: ${enable_gen_hard_constraints:-no}
  OpenMP:                   ${enable_openmp:-yes}
  LTO:                      ${enable_lto:-yes}      $enabled_but_failed_lto
  Float Precision (PF):     ${enable_floatpf:-no}

Documentation:              ${with_doc:-no}
    (HTML):                 ${with_doc_html:-no}
    (PDF):                  ${with_doc_pdf:-no}

Unit Tests:
  check:                    ${with_check:-yes}      $enabled_but_failed_check

-
Files will be installed in the following directories:

  Executables:    $_bindir
  Libraries:      $_libdir
  Header files:   $_includedir
  Extra Data:     $_datadir
  Man pages:      $_mandir
  Documentation:  $_docdir
    (HTML):       $(eval printf "%s" $_htmldir)
    (PDF):        $(eval printf "%s" $_pdfdir)
])

])


