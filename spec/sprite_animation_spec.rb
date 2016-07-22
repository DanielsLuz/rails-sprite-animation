require 'spec_helper'

include SpriteAnimation

describe SpriteAnimation do

  context 'using ImageSize util' do
    it 'should return sizes as expected' do
      GoodSheets.each do |name, info|
        expect(info).to match_array(ImageSize.size(TestUrl + name))
      end
    end
  end

  context 'calling method' do
    xit 'should return correct string' do
      expect(animate_sprite(TestUrl + "coin1.png", "10")).to be_equal("empty")
    end
  end
end

