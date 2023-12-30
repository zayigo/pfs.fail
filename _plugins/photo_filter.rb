require "exifr"

module Jekyll
  module PhotoFilter
    def photo_filter(files)
      photos = files.select {|photo| photo.relative_path.include?("original") }
      photos.sort_by do |photo|
        date_time = EXIFR::JPEG.new(photo.path).date_time
        date_time.nil? ? Time.new(0) : date_time
      end.reverse
    end
  end
end
Liquid::Template.register_filter(Jekyll::PhotoFilter)