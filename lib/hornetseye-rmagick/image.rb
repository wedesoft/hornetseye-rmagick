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
module Magick

  class Image

    def to_type( typecode )
      case typecode
      when Hornetseye::UBYTE
        format = 'I'
        pixel_type = CharPixel
      when Hornetseye::USINT
        format = 'I'
        pixel_type = ShortPixel
      when Hornetseye::UINT
        format = 'I'
        pixel_type = IntegerPixel
      when Hornetseye::SFLOAT
        format = 'I'
        pixel_type = FloatPixel
      when Hornetseye::DFLOAT
        format = 'I'
        pixel_type = DoublePixel
      when Hornetseye::UBYTERGB
        format = 'RGB'
        pixel_type = CharPixel
      when Hornetseye::USINTRGB
        format = 'RGB'
        pixel_type = ShortPixel
      when Hornetseye::UINTRGB
        format = 'RGB'
        pixel_type = IntegerPixel
      when Hornetseye::SFLOATRGB
        format = 'RGB'
        pixel_type = FloatPixel
      when Hornetseye::DFLOATRGB
        format = 'RGB'
        pixel_type = DoublePixel
      else
        Kernel.raise "Cannot convert to typecode #{typecode}"
      end
      Hornetseye::MultiArray.import typecode,
        export_pixels_to_str( 0, 0, columns, rows, format, pixel_type ),
        columns, rows
    end

    def to_multiarray
      case image_type
      when BilevelType, GrayscaleType, GrayscaleMatteType
        case depth
        when 32
          to_type UINT
        when 16
          to_type USINT
        when 1, 8
          to_type UBYTE
        else
          Kernel.raise "Conversion for grayscale image with depth #{depth} not " +
            "implemented"
        end
      when PaletteType, PaletteMatteType, TrueColorType, TrueColorMatteType
        case depth
        when 32
          to_type UINTRGB
        when 16
          to_type USINTRGB
        when 8
          to_type UBYTERGB
        else
          Kernel.raise "Conversion for colour image with depth #{depth} not " +
            "implemented"
        end
      else
        Kernel.raise "Unknown image type #{image_type.inspect}"
      end
    end

  end

  Image.class_eval { include Hornetseye::MultiArrayConversion }

end

