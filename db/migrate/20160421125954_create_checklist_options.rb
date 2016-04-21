class CreateChecklistOptions < ActiveRecord::Migration
  def change
    create_table :checklist_options do |t|
      t.integer :checklist_id
      t.string :description
      t.decimal :points

      t.timestamps null: false
    end
  end
end
