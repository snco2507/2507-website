class Addcolumnstoattendances < ActiveRecord::Migration[5.0]
  def change
  	change_table :attendances do |t|
  		t.integer :user_id
    	t.integer :activity_id
    end
  end
end
