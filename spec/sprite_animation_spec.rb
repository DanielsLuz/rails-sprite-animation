require 'spec_helper'
require 'action_view'

include SpriteAnimation
include ActionView::Helpers

describe SpriteAnimation do

  context 'using ImageSize util' do
    it 'should return sizes as expected' do
      GoodSheets.each do |name, info|
        expect(info).to match_array(ImageSize.size(TestUrl + name))
      end
    end
  end

  context 'calling animate_sprite' do
    it 'should return correct string' do
      allow_any_instance_of(ActionView::Helpers)
        .to receive(:content_tag)
        .and_return("empty")

      expect(animate_sprite(TestUrl + "coin1.png", "10")).to eq("empty")
    end
  end
end

