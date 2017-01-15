class UserSessionsController < ApplicationController

	def new
	end

	def create
		if login(params[:username], params[:password])
			redirect_back_or_to(activities_path, notice: "Logged in successfully")
		else
			flash.now.alert = "Login Failed"
			render action: :new
		end
	end

	def destroy
		logout
		redirect_to(:users, notice: "Logged out")
	end
end
