Logbook Plugin for OpenCPN
=======================================

This is a known state (non flatpack) working macOS 10.14.6 fork of Logbook-Konni, that was originally developed by Konnibe. 
Sadly Konnibe has been unable to continue development on this logbook due to ill health,
and Del   

SV Chiara Stella   
http://sailchiarastella.blogspot.com/

and peter
https://github.com/ptulp/LogbookKonni_pi


are off sailing somewhere perhaps ? :)

 * Copyright (c) 2011-2013 Konnibe
 * Copyright (c) 2013-2015 Del Edson
 * Copyright (c) 2015-2021 Peter Tulp

Thanks for a great plugin folks.

The flatpack for macos crashes the latest stable release 5.8.2. 

The windows version probably works ok. Flatpacks are released for macOS some appear un tested?

This stand alone is here for people to kobble together something until the dev team sorts out conformaty to the API "standard" and porting across the existing stuff to the flatpack so all the stuff released works on macOS... It is Summer in the N after all.

First Step is ....

To enable development of plugins, manually add a CatalogExpert=1 line in the [PlugIns] section in the configuration file to install all plugins blacklisted or otherwise. 

Note: Innocent files are blacklisted when an errant file crashes and the core code will also delete errant dynamic library files. e.g. Autopilot_Route_pi which does not crash in debug mode but causes the release version of OpenCPN 5.8.2 to crash takes out other stuff in the deth nell some times.

Downloading the Plugin
======================

The most recent stable & working version source or flatpack for macOS can not be found ?


The maintenance version (for flatpacks I presume ?) src is at 

https://github.com/rgleason/LogbookKonni_pi

Rick doing a stella job as usual but this repo it needs a tree tweak to compile locally,
 the output crashes same as the flatpack when you click the icon on macOS

Hashing the flatpack dylib and Rick's one differ, this could just be the flatpack env being a "non genuine" macOS build structure. 

After Installing a working Plugin
=================================

###Enable the Plugin (not needed step?)

* Start OpenCPN
* Select Options from the toolbar (cog icon) and go to the Plugins tab.
* Select the Logbook plugin and click Enable to enable the plugin.

###Install Additional Files

There are 2 additional zip files distributed with the logbook, you will need to
install the layouts zip file to make use of all of the features. First you should copy
these files to somewhere convenient, e.g. your home directory, desktop,
etc.  They can be installed from there.  Either that or if you have the
logbook source directory from git they can be installed directly from
there.

* LogbookKonni_Languages.zip (language data files -- included with binary packages)
* LogbookKonni_Layouts.zip (layouts help and other files -- NOT included with packages)

###Layouts

These are necessary to display data e.g. in a browser.

* Start OpenCPN
* Select Options from the toolbar (cog icon) and go to the Plugins tab.
* Select the Logbook plugin
* Click the Preferences button
* In the dialog click "Install" below the label "Install Layouts"
* In the file dialog select the file 'LogbookKonni_Layouts.zip'

Note that the layouts are customisable by the user and can be distributed to
and shared with other OpenCPN logbook users.  If you have developed a useful
custom layout for your logbook then please feel free to send us details.

###Languages

You don't need to install this zip file, it's already included with the package
but we have provided it with the binaries so you can take a look at what's
there or replace files if you need to.

Using the Plugin
================

There are help files included with the plugin.  To access these click
the *help* icon (small book icon) at the end of the logbook main page.  The help
will open in a browser window.

Changing the colour pallet for night use will 
alter the background from dark to white at the moment but otherwise this src tree is very stable on macOS

NOTE: Clicking on a corrupted field of the logbook may cause the app to crash e.g. Lat Longs. 

There is also some on line documentation, at opencpn.org:

Compiling
=========

This plugin builds out of the OpenCPN source tree (i.e. stand alone).  
You do not need to build the entire of OpenCPN or even clone it from git just to build this plugin. 

If you need instructions as to how to build OpenCPN then see the developers
manual at http://opencpn.org/ocpn/developers_manual

You need to have all of the dependencies required to compile OpenCPN installed in
order to be able to build this plugin.  Those might vary depending on your system.

###Clone this repository from github

You might choose to fork this repository on github so you might
use your own git: URL instead of the one below.

```

```

or, from your own fork, a command similar to this (replace delatbabel with
your own git user name):

```

```
###Build on Windows - Untested
###Build on Linux - Untested 

Note that you will need to have all of the development tools installed that
are required to build OpenCPN.  If you have any doubts then run the cmake ..
command and it will complain about missing dependencies.  At the very least
you will need the g++ compiler and development libraries, cmake, gettext, so
install those first and see how far you get.

```



```
###Build on Mac OS X

Note that you will need to have all of the development tools and pre requsites installed that
are required to build OpenCPN.  If you have any doubts then run the cmake ..
command and it will complain about missing dependencies.... ,  see how far you get.



Tools: From Homebrew (http://brew.sh Suggested) 

Note on backward compatability for older computing hardware support ......

Homebrew
"Warning: You are using macOS 10.14.6

We (and Apple) do not provide support for this old version."
Xcode Version 11.3.1 (11C505)

Thankfully it works and wxWidgets 3.2.2.1 seems to be less freaky.

```

```

####Building wxWidgets
(do not use wxmac from Homebrew, it is not compatible with OpenCPN)
Get wxWidgets 3.2.2.1 source from http://wxwidgets.org
Configure, build and install
```
cd wxWidgets-3.2.2.1
./configure --enable-unicode --with-osx-cocoa --with-macosx-sdk=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/  --enable-aui --disable-debug --enable-opengl
make
sudo make install
```

####Building the plugin

```


mkdir LogbookKonni_pi/build
cd LogbookKonni_pi/build
cmake -DCMAKE_BUILD_TYPE:STRING=Release ..
make 

###Packaging on OS X
=========

From inside the build directory, the following command will make packages for your
current platform against the as-built code:

```
make create-pkg It will store the dylib in the app container 
maybe a todo for me is to make it install where it needs to be in the new install paths.



Building zip files
================== 

make package (Creates the logbook database files and templates) 

```

Note that you will need to have the packaging tools installed for your platform and
any other platforms that you build packages for.  e.g. on Ubuntu you will need the
development tools required to build deb file as well as the rpm package required to
build RPM files.


```

```





License
=======
The plugin code is licensed under the terms of the GPL v2 or, at your will, later. 
