require 'nokogiri'
require 'open-uri'

class Parser
  class << self
    def get_img_urls_from(uri)
      imgs = get_imgs(uri)
      img_urls = imgs.map { |img| img_url(img.attr('src'), uri) }

      img_urls.compact.uniq
    end

    private
      def get_imgs(uri)
        begin
          Nokogiri::HTML(open(uri)).css('img')
        rescue SocketError
          raise ArgumentError.new("Your url is not available")
        end
      end

      def img_url(src, page_uri)
        URI.join(page_uri, src).to_s
      end
  end
end
