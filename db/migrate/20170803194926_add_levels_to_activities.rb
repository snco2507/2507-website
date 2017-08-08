class AddLevelsToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :level, :string
  end
end
