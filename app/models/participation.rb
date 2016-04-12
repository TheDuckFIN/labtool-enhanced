class Participation < ActiveRecord::Base

  belongs_to :user
  belongs_to :course
  belongs_to :codereview_group

  validates :repository, :topic, presence: true

end
