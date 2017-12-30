class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  #留言
  has_many :comments, dependent: :destroy
  #最愛、收藏
  has_many :favorites, dependent: :destroy
  #透過收藏 取得餐廳 User.restarants
  has_many :restaurants, through: :favorites
  #喜歡
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant
  #使用source更名，可以直接讀取 User.liked_restaurants


  mount_uploader :avatar, AvatarImageUploader

  def admin?
   	self.role == "admin"
  end

end
