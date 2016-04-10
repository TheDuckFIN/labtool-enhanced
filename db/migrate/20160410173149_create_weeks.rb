class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :course_id
      t.integer :number
      t.integer :max_points
      t.boolean :code_review

      t.timestamps null: false
    end
  end
end
