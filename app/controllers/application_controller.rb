class ApplicationController < ActionController::Base
	before_action :require_login
  protect_from_forgery with: :null_session

  private
	def not_authenticated
	  redirect_to login_path, alert: "Please login first"
	end
end
