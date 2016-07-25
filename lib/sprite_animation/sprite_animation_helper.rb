require_relative 'sprite_animation_util'

module SpriteAnimation
  include SpriteAnimationUtil

  # Returns an image_tag inside a div, an populates the image
  # with data so it can be animated via javascript
  # Params:
  # +image_src+:: a sprite sheet source, just as you would pass to image_tag
  # +frame_count+:: a string representing the number of frames for the sheet
  # +params+:: a hash containing two optional parameters for the animation
  ##- +scale+:: a decimal number that will multiply the frame size. Default: 1
  ##- +orientation+:: a symbol representing the orientation of your sheet.
  ## Can be: :vertical or :horizontal. If not given, it will try to guess.
  def animate_sprite(image_src, frame_count, params = {})
    scale = params[:scale] || 1
    frame_rate = params[:frame_rate] || 80

    img_width, img_height = ImageSize.size(image_src).map {|d| d*scale}

    orientation = 
      params[:orientation] || guess_orientation(img_width, img_height)

    frame_width, frame_height, flag = 
      send(orientation, img_width, img_height, frame_count)

    content_tag(:div, nil, 
                style: div_style(image_src, frame_width, frame_height),
                class: "animated", 
                frameCount: frame_count,
                frameRate: frame_rate,
                flag: flag)
  end

  private

  def div_style(image_src, frame_width, frame_height)
    "width: #{frame_width}px;
    height: #{frame_height}px;
    background: url(#{image_url(image_src)});
    display: block;
    overflow: hidden;"  
  end

  def horizontal(img_width, img_height, frame_count)
    frame_width = img_width / frame_count.to_i
    frame_height = img_height
    [frame_width, frame_height, 1]
  end

  def vertical(img_width, img_height, frame_count)
    frame_width = img_width
    frame_height = img_height / frame_count.to_i
    [frame_width, frame_height, 0]
  end

  def guess_orientation(img_width, img_height)
    img_width > img_height ? :horizontal : :vertical
  end
end
