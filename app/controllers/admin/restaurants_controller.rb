class Admin::RestaurantsController < Admin::BaseController

	def index
		@all_restaurants=Restaurant.page(params[:page]).per(10)
	end

	def new
		@new_restaurant=Restaurant.new
	end

  def show
    @the_restaurant=Restaurant.find(params[:id])
  end

	def create
    @new_restaurant = Restaurant.new(restaurant_params) #實例變數必須和new相同，這樣才能回傳error訊息回去render
    if @new_restaurant.save
      flash[:notice] = "(notice)新增成功"
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "(alert)新增失敗"
      render :new
    end
  end

  def edit #實例變數必須和new相同(使用相同的partial form)
    @new_restaurant=Restaurant.find(params[:id])
  end

  def update #實例變數必須和new相同(使用相同的partial form)
    @new_restaurant = Restaurant.find(params[:id])
    if @new_restaurant.update(restaurant_params)
      flash[:notice] = "(notice)更新成功"
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "(alert)更新失敗"
      render :edit
    end
  end

  def destroy
    @find_restaurant = Restaurant.find(params[:id])
    if @find_restaurant.destroy
      flash[:notice] = "(notice)刪除成功"
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "(alert)刪除失敗"
      render :edit
    end
end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description, :image, :category_id)
  end

end
