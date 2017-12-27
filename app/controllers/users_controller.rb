class UsersController < ApplicationController


	def show
		@user=User.find(params[:id])
		@comments=@user.comments
	end

	private
	def check_user #把edit功能併進去devise 就不用這個功能了
		if User.exists?(:id => params[:id])
			if current_user != User.find(params[:id])
		 		redirect_to root_path, alert: "Dont do things illegal"
		 	end
		else
			redirect_to root_path, alert: "Dont do things illegal"
		end
	end
end
