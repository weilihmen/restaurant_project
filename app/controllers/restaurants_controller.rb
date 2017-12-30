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
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end

end
