class ImageUploader < CarrierWave::Uploader::Base

	include CarrierWave::MiniMagick
  storage :file

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  version :album do
    process :resize_to_fill => [800,800]
  end

  version :thumb, :from_version => :album do
    process :resize_to_fill => [200,200]
  end
end
