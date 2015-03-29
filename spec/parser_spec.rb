require 'spec_helper'
require './parser'

vcr_options = { cassette_name: 'google' }

describe Parser, vcr: vcr_options do
  let(:uri) { 'http://google.com' }
  let(:fake_uri) { 'http://test.host' }

  describe '.get_img_urls_from uri' do
    it { expect(Parser.get_img_urls_from(uri).count).to eq(2) }

    context 'when url unavailable' do
      it { expect { Parser.get_img_urls_from fake_uri }.to raise_error(ArgumentError) }
    end
  end
end
