class CommentsController < ApplicationController
	def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = Comment.new(comment_params)
    @comment.restaurant = @restaurant
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "(notice)新增成功"
      redirect_to restaurant_path(@restaurant)
    else
      flash.now[:alert] = "(alert)新增失敗"
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
