class Adddatetoactivities < ActiveRecord::Migration[5.0]
  def change
  	change_table :activities do |t|
  		t.date :activity_date
  		t.string :details
  		t.date :respond_by
  	end
  end
end
