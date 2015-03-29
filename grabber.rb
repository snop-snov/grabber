require 'fileutils'
require './parser'
require './image_download_worker'

class Grabber
  class << self
    def get_images(url, path)
      FileUtils::mkdir_p(path) unless Dir.exist?(path)
      abs_uri = abs_page_uri(url)
      img_urls = Parser.get_img_urls_from(abs_uri)

      download_images(img_urls, path) if img_urls.any?
    end

    private
      def abs_page_uri(url)
        uri = URI.parse(url)
        uri.absolute? ? uri : "http://#{uri}"
      end

      def download_images(urls, path)
        pool = ImageDownloadWorker.pool
        features = urls.map { |url| pool.future.fetch_img(url, path) }
        features.each { |f| p "Save " + f.value }
      end
  end
end
