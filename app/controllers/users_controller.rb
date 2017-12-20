class UsersController < ApplicationController
	before_action :check_user, only: [:show, :edit, :update]

	def show
		@user=User.find(params[:id])
	end
	def edit
		@user=User.find(params[:id])
	end
	def update
		@user=User.find(params[:id])
	end

	private
	def check_user
		if User.exists?(:id => params[:id])
			if current_user != User.find(params[:id])
		 		redirect_to root_path, alert: "Dont do things illegal"
		 	end
		else
			redirect_to root_path, alert: "Dont do things illegal"
		end
	end
end
