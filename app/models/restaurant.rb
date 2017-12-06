class Restaurant < ApplicationRecord
	validates_presence_of(:name,:tel,:address,:opening_hours)
	mount_uploader :image, PhotoUploader
end
