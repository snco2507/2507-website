class UserSessionsController < ApplicationController
	skip_before_action :require_login, except: [:destroy]

	def new
	end

	def create
		if login(params[:username], params[:password], params[:remember])
			@user = current_user
			if @user.valid_password?('password')
				redirect_to(edit_user_path(@user), alert: "Your password must be changed")
			else
				redirect_back_or_to(activities_path, notice: "Logged in successfully")
			end
		else
			flash.now.alert = "Login Failed"
			render action: :new
		end
	end

	def destroy
		logout
		redirect_to(root_path, notice: "Logged out")
	end
end
