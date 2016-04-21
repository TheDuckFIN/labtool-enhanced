class AddChecklistIdToWeek < ActiveRecord::Migration
  def change
    add_column :weeks, :checklist_id, :integer
  end
end
