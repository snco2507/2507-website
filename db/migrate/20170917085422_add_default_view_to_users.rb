class AddDefaultViewToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :default_view, :string, :default => "bars"
  end
end
