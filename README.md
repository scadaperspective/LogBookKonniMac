Logbook Plugin for OpenCPN
=======================================

This is Logbook-Konni originally developed by Konnibe.  I have forked this from his
git repository and I am continuing development.  Konnibe has been unable to continue
development on this logbook due to ill health.

Del   
SV Chiara Stella   
http://sailchiarastella.blogspot.com/

Binary Distribution
===================

Stand by, we're working on it.

Compiling
=========

* This plugin now builds out of the OpenCPN source tree.  You do not need to build the entire of OpenCPN or even clone it from git just to build this plugin.

* If you need instructions as to how to build OpenCPN then see the developers manual at http://opencpn.org/ocpn/developers_manual

* You need to have all of the dependencies required to compile OpenCPN installed in order to be able to build this plugin.  Those might vary depending on your system.

###Clone this repository from github

You might choose to fork this repository on github so you might
use your own git: URL instead of the one below.

```
git clone https://github.com/delatbabel/LogbookKonni-1.2 LogbookKonni_pi
```

or, from your own fork, a command similar to this (replace delatbabel with
your own git user name):

```
git clone git@github.com:delatbabel/LogbookKonni-1.2.git LogbookKonni_pi
```

###Build on Linux:
```
mkdir LogbookKonni_pi/build
cd LogbookKonni_pi/build
cmake ..
cmake --build .
```

###Build on Mac OS X:
Tools: Can be installed either manually or from Homebrew (http://brew.sh)
```
#brew install git #If I remember well, it is already available on the system
brew install cmake
brew install gettext
ln -s /usr/local/Cellar/gettext/0.19.2/bin/msgmerge /usr/local/bin/msgmerge
ln -s /usr/local/Cellar/gettext/0.19.2/bin/msgfmt /usr/local/bin/msgfmt
```

To target older OS X versions than the one you are running, you need the respective SDKs installed. The easiest way to achieve that is using https://github.com/devernay/xcodelegacy

####Building wxWidgets
(do not use wxmac from Homebrew, it is not compatible with OpenCPN)
Get wxWidgets 3.0.x source from http://wxwidgets.org
Configure, build and install
```
cd wxWidgets-3.0.2
./configure --enable-unicode --with-osx-cocoa --with-macosx-sdk=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk/ --with-macosx-version-min=10.7 --enable-aui --disable-debug --enable-opengl
make
sudo make install
```

####Building the plugin
Before running cmake, you must set the deployment target to OS X 10.7 to be compatible with the libraries used by core OpenCPN
```
export MACOSX_DEPLOYMENT_TARGET=10.7

mkdir LogbookKonni_pi/build
cd LogbookKonni_pi/build
cmake ..
cmake --build .
```

####Packaging on OS X
Get and install the Packages application from http://s.sudre.free.fr/Software/Packages/about.html
After installing Packages create the Plugin package.
```
make create-pkg
```
This will create the Logbookkonni-Plugin_1.2.pkg file in the build directory.
Executing this file will install the plugin.

Enable the Plugin
=================

* Start OpenCPN
* Select Options from the toolbar (spanner icon) and go to the Plugins tab.
* Select the Logbook plugin and click Enable to enable the plugin.

Install Additional Files
========================

There are 3 additional files packaged with the logbook, you will need to
install them to make use of all of the features. First you should copy
these files to somewhere convenient, e.g. your home directory, desktop,
etc.  They can be installed from there.  Either that or if you have the
logbook source directory from git they can be installed directly from
there.

* LogbookKonni_Languages.zip (language data files)
* LogbookKonni_Layouts.zip (layouts)
* LogbookKonni_Other.zip (help and other files)

###Layouts

These are necessary to display data e.g. in a browser.

* Start OpenCPN
* Select Options from the toolbar (spanner icon) and go to the Plugins tab.
* Select the Logbook plugin
* Click the Preferences button
* In the dialog click "Install" below the label "Install Layouts"
* In the file dialog select the file 'LogbookKonni_Layouts.zip'

###Help

* Start OpenCPN
* Select Options from the toolbar (spanner icon) and go to the Plugins tab.
* Select the Logbook plugin
* Click the Preferences button
* In the dialog click "Install" below the label "Install Layouts"
* In the file dialog select the file 'LogbookKonni_Other.zip'

###Languages

* Start OpenCPN
* Select Options from the toolbar (spanner icon) and go to the Plugins tab.
* Select the Logbook plugin
* Click the Preferences button
* In the dialog click "Install" below the label "Install Languages"
* In the file dialog select the file 'LogbookKonni_Languages.zip'
* On Linux you will need to supply your root password.

License
=======
The plugin code is licensed under the terms of the GPL v2 or, at your will, later. 
