class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.datetime :group_time

      t.timestamps null: false
    end
  end
end
