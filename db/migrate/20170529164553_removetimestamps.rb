class Removetimestamps < ActiveRecord::Migration[5.0]
  def change
  	change_table :users do |t|
  		t.remove :created_at, :updated_at
  	end
  end
end
