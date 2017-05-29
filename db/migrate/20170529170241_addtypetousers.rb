class Addtypetousers < ActiveRecord::Migration[5.0]
  def change
  	change_table :users do |t|
  		t.string :type
  	end
  end
end
