hornetseye-rmagick
==================

**Author**:       Jan Wedekind
**Copyright**:    2010
**License**:      GPL

Synopsis
--------

This Ruby extension implements the necessary conversions to save and load images stored in {Hornetseye::MultiArray}.

Installation
------------

**hornetseye-rmagick** provides file-I/O using the *RMagick* Ruby extension. *RMagick* requires the ImageMagick development headers. If you are running Debian or (K)ubuntu, you can install them like this:

    $ sudo aptitude install libmagickwand-dev

To install this Ruby extension, use the following command:

    $ sudo gem install hornetseye-rmagick 

Alternatively you can build and install the Ruby extension from source as follows:

    $ rake
    $ sudo rake install

