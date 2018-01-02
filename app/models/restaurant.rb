class Restaurant < ApplicationRecord
	validates_presence_of(:name,:tel,:address,:opening_hours)
	mount_uploader :image, PhotoUploader
	belongs_to :category
	#喜歡、收藏餐廳 （刪除餐廳時會刪除喜歡的紀錄）
	has_many :favorites, dependent: :destroy
	#留言
	has_many :comments, dependent: :destroy
	#喜歡
	has_many :likes, dependent: :destroy
	has_many :liked_users, through: :likes, source: :user

	def rank_count
		#rank由 favorite 跟 like 相加，之後也可以加入comment
		count=self.favorites.size
		count=count+self.likes.size
		#count=count+self.comments.size
		self.rank=count
		self.save
	end

end
