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

  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships 
  #指回following，user.following指這個user正在追蹤的人(following)

  #follower 可以從user取得 追蹤自己的人(follower)
  has_many :inverse_followships, class_name:"Followship", foreign_key:"following_id"
  has_many :followers, through: :inverse_followships, source: :user
  #先自建一個inverse followships，指定followship model的following_id (對USER來說 USER是PK，指去followship的FK是following_id)

  mount_uploader :avatar, AvatarImageUploader

  def admin?
   	self.role == "admin"
  end
  def has_following?
    self.comments.size >0
  end

end
