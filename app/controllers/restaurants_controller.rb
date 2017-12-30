class RestaurantsController < ApplicationController
	
	def index
		@restaurants=Restaurant.page(params[:page]).per(9)
		@categories=Category.all
	end
	def show
		@restaurant = Restaurant.find(params[:id])
		@favorite=Favorite.where( :restaurant_id => @restaurant, :user_id => current_user )
		@comment = Comment.new
		if current_user.restaurants.exists?(:id => params[:id])
			@favorite_check=:True
		else
			@favorite_check=:False
		end
	end
	def feeds
		@categories=Category.all
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end

  def like
    @restaurant = Restaurant.find(params[:id])
    @restaurant.likes.create!(user: current_user)
    redirect_back(fallback_location: root_path)  # 導回上一頁
  end
  def unlike
    @restaurant = Restaurant.find(params[:id])
    like = Like.where(restaurant: @restaurant, user: current_user)
    like.destroy_all
    redirect_back(fallback_location: root_path)
  end
end
