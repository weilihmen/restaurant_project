class CommentsController < ApplicationController
	def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = Comment.new(comment_params)
    @comment.restaurant = @restaurant
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment新增成功"
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to request.referrer, alert: "Comment不得為空白"
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = Comment.find(params[:id])

    if current_user.admin?
      @comment.destroy
      redirect_to restaurant_path(@restaurant)
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
