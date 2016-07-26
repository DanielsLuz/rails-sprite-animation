# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sprite_animation/version'

Gem::Specification.new do |spec|
  spec.name          = "sprite_animation"
  spec.homepage      = "https://github.com/DanielsLuz/rails-sprite-animation"
  spec.version       = SpriteAnimation::VERSION
  spec.authors       = ["DanielsLuz"]
  spec.email         = ["danielluz1995@gmail.com"]

  spec.summary       = %q{Simple gem for sprite sheet animation}
  spec.description   = %q{This gem makes it easy adding an animated image given a sprite sheet}
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "fakeweb", "~> 1.3"

  spec.add_runtime_dependency "fastimage", "~> 2.0"
  spec.add_runtime_dependency "jquery-rails", "~> 4.0"
end
