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
end
