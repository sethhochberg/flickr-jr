class Photo < ActiveRecord::Base

	has_one :user, :through => :album
	belongs_to :album

	mount_uploader :image, ImageUploader
end