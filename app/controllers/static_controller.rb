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
		honeypot = params[:honeypot]

		if honeypot == ""
			UserMailer.contact_email(name, email, subject, message).deliver_now
			redirect_to(contact_path, notice: "Contact request successfully sent.")
		else	
			redirect_to(contact_path, alert: "We don't accept contact requests from bots.")
		end
	end

	def training
	end

	def new_tp(file)
		
	end
end
