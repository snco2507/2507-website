class Removetype < ActiveRecord::Migration[5.0]
  def change
  	change_table :users do |t|
  		t.remove :type
  	end
  end
end
