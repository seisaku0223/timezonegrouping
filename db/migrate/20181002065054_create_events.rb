class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.text :requirement
      t.integer :manager_id

      t.timestamps null: false
    end
  end
end
