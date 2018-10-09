class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.integer :on_requirement

      t.timestamps null: false
    end
  end
end
