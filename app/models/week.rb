class Week < ActiveRecord::Base

  belongs_to :course

  has_many :weekly_submissions

  validates :number, numericality: true

  def to_s
    "#{number} (review: #{code_review?}, max points: #{max_points})"
  end

end
