class AddDefaultCodereviewGroupIdToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :default_codereview_group_id, :integer
  end
end
