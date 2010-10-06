# hornetseye-rmagick - RMagick integration for Hornetseye
# Copyright (C) 2010 Jan Wedekind
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
module Hornetseye

  class MultiArray

    class << self

      def load_magick( file )
        Magick::Image.read( file ).first.to_multiarray
      end

      def load_ubyte( file )
        Magick::Image.read( file ).first.to_type UBYTE
      end

      def load_usint( file )
        Magick::Image.read( file ).first.to_type USINT
      end

      def load_uint( file )
        Magick::Image.read( file ).first.to_type UINT
      end

      def load_ubytergb( file )
        Magick::Image.read( file ).first.to_type UBYTERGB
      end

      def load_usintrgb( file )
        Magick::Image.read( file ).first.to_type USINTRGB
      end

      def load_uintrgb( file )
        Magick::Image.read( file ).first.to_type UINTRGB
      end

    end

  end

end

