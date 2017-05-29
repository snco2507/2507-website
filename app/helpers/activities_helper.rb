module ActivitiesHelper
	def activity_params
		params.require(:activity).permit(:title, :location, :category, :activity_date, :details, :respond_by)
	end
end
