class NoticeImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Create different versions of your uploaded files:

  version :landscape, :if => :landscape? do
    process :resize_to_fit => [430, 2000]
  end

  version :landscape_tiny, :if => :landscape? do
    process :resize_to_fit => [100, 200]
  end

  version :portrait, :if => :portrait? do
    process :resize_to_fit => [320, 2000]
  end

  version :portrait_tiny, :if => :portrait? do
    process :resize_to_fit => [60, 200]
  end

  protected

  def landscape? img
    # pic = MiniMagick::Image.open img.path
    # model.landscape = pic[:width] > pic[:height]
    #
    # Couldn't get this to work (think there's a bug in CarrierWave
    # For now, all notice images will be landscape
    model.landscape = true
  end

  def portrait? img
    return ! landscape?(img)
  end

   def cache_dir
    "#{Rails.root}/tmp/uploads"
  end
end

