require 'celluloid/autostart'

class ImageDownloadWorker
  include Celluloid

  def fetch_img(url, path)
    filename = File.expand_path(img_name(url), path)
    File.open(filename, "wb") do |file|
      file.write(open(url).read)
    end
    filename
  end

  private
    def img_name(url)
      File.basename(url)
    end
end
