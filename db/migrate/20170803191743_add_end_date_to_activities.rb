class AddEndDateToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :end_date, :date
  end
end
