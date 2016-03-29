class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :user_id
      t.integer :course_id
      t.boolean :teacher

      t.timestamps null: false
    end
  end
end
