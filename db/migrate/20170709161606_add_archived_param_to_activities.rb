class AddArchivedParamToActivities < ActiveRecord::Migration[5.0]
  def change
  	add_column :activities, :archived, :boolean, null: false, default: false
  end
end
