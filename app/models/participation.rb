class Participation < ActiveRecord::Base

  belongs_to :user
  belongs_to :course
  belongs_to :codereview_group

  validates :repository, :topic, presence: true
  validates :user_id, uniqueness: { scope: :course_id }

  validates :repository, url: true

end
