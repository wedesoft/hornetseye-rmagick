require 'rake'

PKG_NAME = 'hornetseye-rmagick'
PKG_VERSION = '1.0.5'
RB_FILES = ['config.rb'] + FileList[ 'lib/**/*.rb' ]
TC_FILES = FileList[ 'test/tc_*.rb' ]
TS_FILES = FileList[ 'test/ts_*.rb' ]
PKG_FILES = [ 'Rakefile', 'README.md', 'COPYING', '.document' ] +
            RB_FILES + TS_FILES + TC_FILES
BIN_FILES = [ 'README.md', 'COPYING', '.document' ] +
            RB_FILES + TS_FILES + TC_FILES
SUMMARY = %q{rmagick integration for Hornetseye}
DESCRIPTION = %q{This Ruby extension implements the necessary conversions to save and load images stored in Hornetseye::MultiArray.}
LICENSE = 'GPL-3+'
AUTHOR = %q{Jan Wedekind}
EMAIL = %q{jan@wedesoft.de}
HOMEPAGE = %q{http://wedesoft.github.io/hornetseye-rmagick/}
