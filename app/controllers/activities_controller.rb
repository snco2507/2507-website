class ActivitiesController < ApplicationController

	include ActivitiesHelper

	def index
		@activities = Activity.all
	end

	def show
		@activity = Activity.find(params[:id])

    respond_to do |format|
      format.html
      format.jpg do
        kit = IMGKit.new(render_to_string)
        img = kit.to_img(:jpg)
        send_data img, type: "image/jpg", disposition: "inline"
      end
    end
	end

	def new
		@activity = Activity.new
	end

	def create
		@activity = Activity.new(activity_params)
		@activity.save
		flash.notice = "Activity '#{@activity.title}' created"
  	redirect_to activity_path(@activity)
	end

	def destroy
		@activity = Activity.find(params[:id])
		@activity.destroy
		flash.notice = "Activity '#{@activity.title}' deleted"
		redirect_to activities_path
	end

	def edit
		@activity = Activity.find(params[:id])
	end

	def update
		@activity = Activity.find(params[:id])
		@activity.update(activity_params)
		flash.notice = "Activity '#{@activity.title}' updated"
		redirect_to activity_path(@activity)
	end

	def report
    @activity = Activity.find(params[:id])
		title = params[:title]
		location = params[:location]
		date = params[:date]
		details = params[:details]
		attendees = params[:attendees]
		UserMailer.report_email(title, location, date, details, attendees).deliver_now
    flash.notice ="Post activity report sent"
    redirect_to activity_path(@activity)
	end

  def archive
    @activity = Activity.find(params[:id])
    @activity.archived = true
    @activity.save
    redirect_to activities_path
  end
end