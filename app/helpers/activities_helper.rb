module ActivitiesHelper
	def activity_params
		params.require(:activity).permit(:title, :location, :category)
	end
end
