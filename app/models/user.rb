class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments
  has_many :favorites
  has_many :restaurants, through: :favorites
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


   def admin?
   	self.role == "admin"
   end

end
