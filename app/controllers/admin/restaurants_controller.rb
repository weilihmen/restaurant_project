class Admin::RestaurantsController < ApplicationController
	before_action :authenticate_user!
	before_action	:authenticate_admin

	def index
		@allrestaurants=Restaurant.all
	end

	def new
		@newrestaurant=Restaurant.new
	end


end
