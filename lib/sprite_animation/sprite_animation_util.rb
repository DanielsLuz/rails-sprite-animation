require 'fastimage'
require 'uri'

module SpriteAnimationUtil #:nodoc: all
  class ImageSize
    def self.size(image_src)
      FastImage.size(parse_image_path(image_src), :raise_on_failure => true)
    end

    private

    def self.parse_image_path(image_src)
      if uri?(image_src)
        image_src
      else
        ::Rails.root.to_s+"/app/assets/images/#{image_src}"
      end
    end

    def self.uri?(string)
      uri = URI.parse(string)
      %w( http https ).include?(uri.scheme)
    rescue URI::BadURIError
      false
    rescue URI::InvalidURIError
      false
    end
  end
end
