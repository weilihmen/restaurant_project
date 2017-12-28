class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if:  :devise_controller?
  before_action :authenticate_user!

  def index
    redirect_to restaurants_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :intro, :avatar])
  end

  def authenticate_admin
  	unless current_user.admin?
  		flash[:alert]="非管理員(Not Allow!)，redirect_to root_path"
  		redirect_to root_path  		
  	end
  end

end
