class CreateCodereviewGroups < ActiveRecord::Migration
  def change
    create_table :codereview_groups do |t|
      t.integer :course_id
      t.string :name

      t.timestamps null: false
    end
  end
end
