class Week < ActiveRecord::Base

  belongs_to :course

  has_many :weekly_submissions, dependent: :destroy
  belongs_to :checklist

  validates :number, numericality: { greater_than_or_equal_to: 0 }
  validates :max_points, numericality: { greater_than_or_equal_to: 0 }

end
