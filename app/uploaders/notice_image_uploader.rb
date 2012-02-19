class NoticeImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

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
    pic = Magick::Image.read(img.path).first
    model.landscape = pic.columns >= pic.rows
  end

  def portrait? img
    return ! landscape?(img)
  end
end
