class AttendancesController < ApplicationController
	def new
		@attendance = Attendance.new
	end

	def create
		activity = Activity.find(params[:activity_id])
		if Attendance.where("user_id = ? AND activity_id = ?", params[:user_id], params[:activity_id]).blank?
			@attendance = Attendance.new
			@attendance.user_id = params[:user_id]
			@attendance.activity_id = params[:activity_id]
			if params[:level]
				@attendance.level = params[:level]
			end
			@attendance.save
		end
		redirect_to activity_path(Activity.find(params[:activity_id]))
	end

	def destroy
		Attendance.where("user_id = ? AND activity_id = ?", params[:user_id], params[:activity_id]).delete_all
		redirect_to activity_path(Activity.find(params[:activity_id]))
	end
end