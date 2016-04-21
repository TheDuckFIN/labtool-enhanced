class CreateReviewGroups < ActiveRecord::Migration
  def change
    create_table :review_groups do |t|
      t.integer :teacher_id

      t.timestamps null: false
    end
  end
end
