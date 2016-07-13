require "sprite_animation/version"
require "sprite_animation/sprite_animation_helper"

module SpriteAnimation 
  class Engine < Rails::Engine
  end

  class Railtie < Rails::Railtie
    initializer "sprite_animation.initialize_sprite_animation_helper" do |app|
      ActiveSupport.on_load(:action_view) do
        include SpriteAnimation
      end
    end
  end
end
