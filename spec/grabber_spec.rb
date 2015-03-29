require 'spec_helper'
require './grabber'

vcr_options = { cassette_name: 'google' }

describe Grabber, vcr: vcr_options do
  let(:url) { 'google.com' }
  let(:path) { Dir.mktmpdir }
  after(:each) { FileUtils.remove_entry_secure path }

  describe '.get_images' do
    it 'should get images' do
      allow_any_instance_of(ImageDownloadWorker).to receive(:fetch_img).and_return('img.jpg')
      expect(Grabber.get_images(url, path).count).to eq(2)
    end
  end
end
