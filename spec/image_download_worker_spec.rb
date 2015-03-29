require 'spec_helper'
require './image_download_worker'

vcr_options = { cassette_name: 'nice_girl' }

describe ImageDownloadWorker, vcr: vcr_options do
  subject { ImageDownloadWorker.new }
  let(:img_url) { 'http://cdn.trinixy.ru/pics5/20121130/nice_girls_67.jpg' }
  let(:path) { Dir.mktmpdir }
  after(:each) { FileUtils.remove_entry_secure path }

  describe '#fetch_img' do
    let(:img_path) { path + '/nice_girls_67.jpg' }

    it 'should save image from url' do
      expect(subject.fetch_img(img_url, path)).to eq(img_path)
      expect(File.read(img_path)).not_to be_empty
    end
  end

end
