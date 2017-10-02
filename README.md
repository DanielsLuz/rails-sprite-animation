# SpriteAnimation

This gem makes it easy creating animated images in your views given a sprite sheet. Just add it to your project and start animating sprite sheets.
SpriteAnimation gem encapsulates all the javascript, jquery and rails logic you need. It was made to be as simple as possible. Try it!

## Usage

SpriteAnimation gem extends your view helpers with one more method: `animate_sprite`.

`animate_sprite(image_src, frame_count, params = {})`

**image_src**

The source of the image, just like in [image_tag helper](http://apidock.com/rails/ActionView/Helpers/AssetTagHelper/image_tag).
Can be a local image or a URL of an image.

**frame_count**

String with the number of frames that your sprite sheet has.

**params**

An optional hash containing the following parameters:

* scale: Decimal value to resize your frame size. Defaults to 1.
* orientation: A symbol containing the orientation of your sprite sheet. <br>Can be: `:vertical` or `:horizontal`.
 If it's not given, SpriteAnimation will try to guess it based on the height and width of your sprite sheet.

## Installation
Add this line to your application's Gemfile:
```ruby
gem 'sprite_animation'
```
 
Then run
```ruby
bundle install
```

After that, just add the require statement to your `application.js`
```ruby
//= require sprite_animation
```

## Examples
Using [slim-template](https://github.com/slim-template/slim)
```
= animate_sprite("sample-sheet.png", "10")      # Looks for a sprite sheet located at app/assets/images/ with 10 frames.
= animate_sprite("sample-sheet.png", "10", scale: 0.5)      # Same as above, but reducing the frame size to 50% of the original.
= animate_sprite("horizontal-sheet.png", "10", orientation: :horizontal)    # Forces the orientation to be horizontal
= animate_sprite("http://www.remotesheet.com/sheet.jpg", "12") # Fetches the sprite sheet at the URL and animates it with 12 frames
```

## Dependencies
- [jquery-rails](https://github.com/rails/jquery-rails)
- [fastimage](https://github.com/sdsykes/fastimage)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DanielsLuz/sprite_animation. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Changelog
**0.3.0**
Added infrastructure for rspec tests.
