class Week < ActiveRecord::Base

  belongs_to :course

  has_many :weekly_submissions, dependent: :destroy
  belongs_to :checklist

  validates :number, numericality: true

end
