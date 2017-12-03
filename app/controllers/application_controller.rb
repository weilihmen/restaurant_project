class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin
  	unless current_user.admin?
  		flash[:alert]="非管理員(Not Allow!)，redirect_to root_path"
  		redirect_to root_path  		
  	end
  end

end
