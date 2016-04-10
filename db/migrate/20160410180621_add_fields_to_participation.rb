class AddFieldsToParticipation < ActiveRecord::Migration
  def change
    add_column :participations, :active, :boolean
    add_column :participations, :topic, :string
    add_column :participations, :repository, :string
    add_column :participations, :codereview_group_id, :integer
  end
end
