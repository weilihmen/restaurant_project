class FavoritesController < ApplicationController
	def create
		@restaurant=Restaurant.find(params[:restaurant_id])
		@favorite=Favorite.new()
		@favorite.user_id=current_user.id
		@favorite.restaurant_id=@restaurant.id
		@favorite.save!
		@restaurant.rank_count
		redirect_back(fallback_location: root_path)
	end
	def destroy
		@restaurant=Restaurant.find(params[:restaurant_id])
		@favorite=Favorite.where(:restaurant_id => @restaurant.id, :user_id => current_user.id )
		@favorite.destroy_all
		@restaurant.rank_count
		redirect_back(fallback_location: root_path)
	end
end
