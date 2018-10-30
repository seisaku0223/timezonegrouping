class AddGroupIdToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :group_id, :integer
  end
end
