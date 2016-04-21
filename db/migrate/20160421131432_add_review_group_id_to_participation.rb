class AddReviewGroupIdToParticipation < ActiveRecord::Migration
  def change
    add_column :participations, :review_group_id, :integer
  end
end
