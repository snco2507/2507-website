class StaticController < ApplicationController
	skip_before_action :require_login
	def index
	end

	def about
	end

	def join
	end

	def gallery
	end

	def contact
	end

	def forms
	end

	def contact_email
		name = params[:name]
		email = params[:email]
		subject = params[:subject]
		message = params[:message]
		UserMailer.contact_email(name, email, subject, message).deliver_now
	end
end
