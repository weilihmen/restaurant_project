class FavoritesController < ApplicationController
	def create
		@restaurant=Restaurant.find(params[:restaurant_id])
		@favorite=Favorite.new()
		@favorite.user_id=current_user
		@favorite.restaurant_id=@restaurant
		@favorite.save!
		redirect_to restaurant_path(@restaurant)
	end
	def destroy
	end
end
