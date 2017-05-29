class Renametypecolumn < ActiveRecord::Migration[5.0]
  def change
  	change_table :users do |t|
  		t.rename :type, :user_type
  	end
  end
end
