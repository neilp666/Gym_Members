class AddMemberIdToActvities < ActiveRecord::Migration
  def change
    add_column :activities, :member_id, :integer
  end
end
