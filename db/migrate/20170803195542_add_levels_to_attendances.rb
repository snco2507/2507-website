class AddLevelsToAttendances < ActiveRecord::Migration[5.0]
  def change
    add_column :attendances, :level, :string
  end
end
