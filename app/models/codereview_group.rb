class CodereviewGroup < ActiveRecord::Base

  belongs_to :course

  validates :name, presence: true

end
