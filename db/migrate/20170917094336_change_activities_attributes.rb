class ChangeActivitiesAttributes < ActiveRecord::Migration[5.0]
  def change
  	change_column_null :activities, :title, false
  	change_column_null :activities, :activity_date, false
  	change_column_null :activities, :details, false
  	change_column_null :activities, :respond_by, false
  end
end
