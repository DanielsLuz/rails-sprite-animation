require 'uri'
require 'fastimage'

module SpriteAnimation
  def animate_sprite(image_src, frame_count, params = {})
    scale = params[:scale] || 1

    img_width, img_height =
      FastImage.size(parse_image_path(image_src), 
                     :raise_on_failure => true).map { |d| d*scale }

      orientation = params[:orientation] ||
        guess_orientation(img_width, img_height)

      frame =
        send(orientation,*[img_width,img_height,frame_count])

      image = image_tag(image_url(image_src), class: "animated",
                        frameCount: frame_count, 
                        frameLength: frame[:length],
                        frameSide: frame[:margin],
                        style: frame[:style])
      content_tag(:div, image, 
                  style: animated_div_style(frame[:width],frame[:height]))
  end 

  private

  def animated_div_style(frame_width, frame_height)
    "width: #{frame_width}px;
     height: #{frame_height}px;
     display: block;
     overflow: hidden"
  end

  def horizontal(img_width, img_height, frame_count)
    frame_width = img_width / frame_count.to_i
    frame_height = img_height
    {
      width: frame_width,
      height: frame_height,
      margin: "left",
      length: frame_width,
      style: "height: " + img_height.to_s + "px"
    }
  end

  def vertical(img_width, img_height, frame_count)
    frame_width = img_width
    frame_height = img_height / frame_count.to_i
    {
      width: frame_width,
      height: frame_height,
      margin: "top",
      length: frame_height,
      style: "width: " + img_width.to_s + "px"
    }
  end

  def guess_orientation(img_width, img_height)
    img_height > img_width ? :vertical : :horizontal
  end

  def parse_image_path(image_src)
    if uri?(image_src)
      image_src
    else
      ::Rails.root.to_s+"/app/assets/images/#{image_src}"
    end
  end

  def uri?(string)
    uri = URI.parse(string)
    %w( http https ).include?(uri.scheme)
  rescue URI::BadURIError
    false
  rescue URI::InvalidURIError
    false
  end
end
