class AddCurrentWeekIdToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :current_week_id, :integer
  end
end
