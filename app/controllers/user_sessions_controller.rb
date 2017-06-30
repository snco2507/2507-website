class UserSessionsController < ApplicationController
	skip_before_action :require_login, except: [:destroy]

	def new
	end

	#Login
	def create
		if login(params[:username], params[:password])
			# Save user into variable
			@user = current_user

			#Check if user password is "password"
			if @user.valid_password?('password')
				#if it is, ask them to change it
				redirect_to(edit_user_path(@user))
				flash.alert = "You need to change your password"
			else
				#else log them in and take them to activities.
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
