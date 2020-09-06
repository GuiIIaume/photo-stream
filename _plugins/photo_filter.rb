require "exifr/jpeg"

module Jekyll
  module PhotoFilter
    def photo_filter(files)
      photos = files.select {|photo| photo.relative_path.include?("original") }
      photos = photos.sort_by do |photo|
        EXIFR::JPEG.new(photo.path).date_time_original
      end.reverse
    end
  end
end
Liquid::Template.register_filter(Jekyll::PhotoFilter)
