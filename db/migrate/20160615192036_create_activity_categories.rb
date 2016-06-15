class CreateActivityCategories < ActiveRecord::Migration
  def change
    create_table :activity_categories do |t|
      t.integer :activity_id
      t.integer :category_id
    end
  end
end
