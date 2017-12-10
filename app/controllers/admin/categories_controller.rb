class Admin::CategoriesController < ApplicationController
	before_action :authenticate_user!
  before_action :authenticate_admin

  def index
  	@categories = Category.all
	  if params[:id] #確認是否有id=?傳入網頁，因為是共用同一個submmit按鈕
	    @category = Category.find(params[:id])
	  else
	    @category = Category.new
	  end
  end

  def update
	  @category = Category.find(params[:id])
	  if @category.update(category_params)
	    redirect_to admin_categories_path
	    flash[:notice] = "category was successfully updated"
	  else
	    @categories = Category.all
	    render :index
	  end
	end

  def create
	  @category = Category.new(category_params)
	  if @category.save
	    flash[:notice] = "category was successfully created"
	    redirect_to admin_categories_path
	  else
	    @categories = Category.all #失敗時要把Categories回傳給index
	    render :index
	  end
  end

  private
  def category_params
  	params.require(:category).permit(:name)
	end
end
