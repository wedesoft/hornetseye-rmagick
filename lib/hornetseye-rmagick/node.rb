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

  class Node

    def to_magick
      unless dimension == 2
        raise "Array must have two dimensions (but has #{dimension})"
      end
      case typecode
      when UBYTE
        pixel_type = Magick::CharPixel
        colourspace = 'I'
        depth = 8
      when USINT
        pixel_type = Magick::ShortPixel
        colourspace = 'I'
        depth = 16
      when UINT
        pixel_type = Magick::IntegerPixel
        colourspace = 'I'
        depth = 32
      when SFLOAT
        pixel_type = Magick::FloatPixel
        colourspace = 'I'
        depth = nil
      when DFLOAT
        pixel_type = Magick::DoublePixel
        colourspace = 'I'
        depth = nil
      when UBYTERGB
        pixel_type = Magick::CharPixel
        colourspace = 'RGB'
        depth = 8
      when USINTRGB
        pixel_type = Magick::ShortPixel
        colourspace = 'RGB'
        depth = 16
      when UINTRGB
        pixel_type = Magick::IntegerPixel
        colourspace = 'RGB'
        depth = 32
      when SFLOATRGB
        pixel_type = Magick::FloatPixel
        colourspace = 'RGB'
        depth = nil
      when DFLOATRGB
        pixel_type = Magick::DoublePixel
        colourspace = 'RGB'
        depth = nil
      else
        raise "Conversion from #{typecode} to Magick::Image not implemented"
      end
      retval = Magick::Image.new( *shape ) { self.depth = depth if depth }
      str = memory.read memory.size
      retval.import_pixels 0, 0, shape[0], shape[1], colourspace, str, pixel_type
      retval
    end

    def save_magick( file )
      to_magick.write file
    end

    def save_ubyte( file )
      to_ubyte.save_magick
    end

    def save_usint( file )
      to_usint.save_magick
    end

    def save_uint( file )
      to_uint.save_magick
    end

    def save_ubytergb( file )
      to_ubytergb.save_magick
    end

    def save_usintrgb( file )
      to_usintrgb.save_magick
    end

    def save_uintrgb( file )
      to_uintrgb.save_magick
    end

  end

end
