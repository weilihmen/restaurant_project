class Admin::RestaurantsController < ApplicationController
	before_action :authenticate_user!
	before_action	:authenticate_admin

	def index
		@all_restaurants=Restaurant.all
	end

	def new
		@new_restaurant=Restaurant.new
	end

	def create
    @new_restaurant = Restaurant.new(restaurant_params) #實例變數必須和new相同，這樣才能回傳error訊息回去render
    if @new_restaurant.save
      flash[:notice] = "(notice)儲存成功"
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "(alert)儲存失敗"
      render :new
    end
  end

  def edit
    @new_restaurant=Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description)
  end

end
