class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|

    	t.string :title
    	t.string :location
    	t.string :category

      t.timestamps
    end
  end
end
