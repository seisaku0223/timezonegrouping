class AddNoGroupToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :no_group, :boolean
  end
end
