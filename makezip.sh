#!/bin/sh

#
# This is needed because creating the zip files with cmake does not work.
# See the comments in cmake/PluginLocalization.cmake
#

#
# Languages zip contains the language resource files.  Build the plugin
# first using cmake before creating this file.  We build this file anyway
# even though the languages are included in the packages just in case
# there are changes needed.
#
rm -f LogbookKonni_Languages.zip
(
    cd build/Resources
    zip -r ../../LogbookKonni_Languages *
)

#
# Layouts zip contains the layouts used when printing or saving the logbook
# to HTML or ODT file format.
#
rm -f LogbookKonni_Layouts.zip
(
    cd data
    zip -r ../LogbookKonni_Layouts.zip HTMLLayouts ODTLayouts
)

#
# Others zip file contains the help.
#
rm -f LogbookKonni_Other.zip
(
    cd data
    zip -r ../LogbookKonni_Other.zip Help.html Clouds Images
)
