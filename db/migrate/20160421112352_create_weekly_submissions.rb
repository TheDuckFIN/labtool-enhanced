class CreateWeeklySubmissions < ActiveRecord::Migration
  def change
    create_table :weekly_submissions do |t|
      t.integer :participation_id
      t.integer :week_id
      t.decimal :points

      t.timestamps null: false
    end
  end
end
