# PECL

PECL : PEAR = Composer : Packagist

PECL is a repository of PHP extensions that are made available to you via the PEAR packaging system. This section of the manual is intended to demonstrate how to obtain and install PECL extensions.

These instructions assume /your/phpsrcdir/ is the path to the PHP source distribution, and that extname is the name of the PECL extension. Adjust accordingly. These instructions also assume a familiarity with the » pear command. The information in the PEAR manual for the pear command also applies to the pecl command.

To be useful, a shared extension must be built, installed, and loaded. The methods described below provide you with various instructions on how to build and install the extensions, but they do not automatically load them. Extensions can be loaded by adding an extension directive to the php.ini file, or through the use of the dl() function.

When building PHP modules, it's important to have known-good versions of the required tools (autoconf, automake, libtool, etc.) See the » Anonymous Git Instructions for details on the required tools, and required versions.
