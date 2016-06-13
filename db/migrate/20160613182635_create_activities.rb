class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :location
      t.text :bio
      t.timestamps
    end
  end
end
