class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.integer :desire_day
      t.integer :desire_time
      t.integer :on_requirement

      t.timestamps null: false
    end
  end
end
