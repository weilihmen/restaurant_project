class Followship < ApplicationRecord
	belongs_to :user
  belongs_to :following, class_name: "User" 
  #followship裡面有個following id，但沒有following這個model，所以要用class_name把這個id指向USER model
  validates :following_id, uniqueness: { scope: :user_id }
  #驗證同樣的following_id 如果有同樣的user_id就不能存入 #validates :name, uniqueness: true
  

end