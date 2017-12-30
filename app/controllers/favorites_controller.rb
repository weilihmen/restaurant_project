class FavoritesController < ApplicationController
	def create
		@restaurant=Restaurant.find(params[:restaurant_id])
		@favorite=Favorite.new()
		@favorite.user_id=current_user.id
		@favorite.restaurant_id=@restaurant.id
		@favorite.save!
		redirect_to restaurant_path(@restaurant)
	end
	def destroy
		@restaurant=Restaurant.find(params[:restaurant_id])
		@favorite=Favorite.where(:restaurant_id => @restaurant.id, :user_id => current_user.id )
		@favorite.destroy_all
		redirect_to restaurant_path(@restaurant)
	end
end
