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
	
	def uploadTP
		uploaded_io = params[:programme]
		if uploaded_io.original_filename == "tp.pdf"
	  	File.open(Rails.root.join('public', uploaded_io.original_filename), 'wb') do |file|
	    	file.write(uploaded_io.read)
	    	redirect_to(training_path, notice: "Training Programme uploaded.")
	  	end
	  else
	  	redirect_to(training_path, alert: "Training programme must be named 'tp.pdf'")
	  end
	end

	def uploadST
		uploaded_io = params[:programme]
		if uploaded_io.original_filename == "st.pdf"
	  	File.open(Rails.root.join('public', uploaded_io.original_filename), 'wb') do |file|
	    	file.write(uploaded_io.read)
	    	redirect_to(training_path, notice: "Staff Tasking uploaded.")
	  	end
	  else
	  	redirect_to(training_path, alert: "Staff Tasking must be named 'st.pdf'")
	  end
	end

	def uploadNT
		uploaded_io = params[:programme]
		if uploaded_io.original_filename == "nt.pdf"
	  	File.open(Rails.root.join('public', uploaded_io.original_filename), 'wb') do |file|
	    	file.write(uploaded_io.read)
	    	redirect_to(training_path, notice: "NCO Tasking uploaded.")
	  	end
	  else
	  	redirect_to(training_path, alert: "NCO Tasking must be named 'nt.pdf'")
	  end
	end
end
